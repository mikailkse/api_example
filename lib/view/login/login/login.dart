import 'package:flutter/material.dart';
import '../view/login_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const ROUTE_NAME = "login";
  @override
  LoginView createState() => LoginView();
}
