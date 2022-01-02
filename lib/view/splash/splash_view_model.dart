import 'package:apiexample/core/auth/auth_manager.dart';
import 'package:apiexample/view/home/home/home.dart';
import 'package:apiexample/view/home/model/user_model.dart';
import 'package:apiexample/view/login/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './splash.dart';

abstract class SplashViewModel extends State<Splash> {
  Future<void> controlToApp() async {
    readAuthManager.fetchUserLogin();
    if (readAuthManager.isLogin) {
      print("home");
      Future.delayed(const Duration(seconds: 1));
      readAuthManager.model = UserModel.fake();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Home()));
    } else {
      print("login");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  @override
  void initState() {
    super.initState();
    controlToApp();
  }

  AuthenticationManager get readAuthManager =>
      context.read<AuthenticationManager>();
}
