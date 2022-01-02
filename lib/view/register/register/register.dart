import 'package:flutter/material.dart';
import '../view/register_view.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const ROUTE_NAME = "register";

  @override
  RegisterView createState() => RegisterView();
}
