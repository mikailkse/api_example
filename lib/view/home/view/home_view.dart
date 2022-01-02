import 'package:apiexample/core/cache/local_manager.dart';
import 'package:apiexample/view/login/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              localeManager.setStringValue(PreferencesKeys.TOKEN, "abc");
              var data =
                  await localeManager.getStringValue(PreferencesKeys.TOKEN);
              print(data);
            },
            child: CircleAvatar(
              maxRadius: 100,
              backgroundImage: NetworkImage(
                userModel?.imageUrl ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(userModel?.name ?? ''),
      leading: IconButton(
        icon: const Icon(Icons.check),
        onPressed: () {
          localeManager.clearAll();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Login()));
        },
      ),
    );
  }
}
