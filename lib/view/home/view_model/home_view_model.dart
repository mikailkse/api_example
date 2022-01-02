import 'package:apiexample/core/auth/auth_manager.dart';
import 'package:apiexample/core/cache/local_manager.dart';
import 'package:apiexample/view/home/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../home/home.dart';

abstract class HomeViewModel extends State<Home> {
  String token = '';

  late UserModel? userModel;

  void getTokenCache() async {
    token = localeManager.getStringValue(PreferencesKeys.TOKEN);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  LocaleManager localeManager = LocaleManager.instance;
}
