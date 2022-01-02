import 'package:flutter/material.dart';
import '../view/home_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const ROUTE_NAME = "home";
  @override
  HomeView createState() => HomeView();
}
