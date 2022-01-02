import 'package:apiexample/view/home/home/home.dart';
import 'package:apiexample/view/login/login/login.dart';
import 'package:apiexample/view/register/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case Login.ROUTE_NAME:
        return FadeTransitionPageRoute(const Login(), settings: args);
      case Home.ROUTE_NAME:
        return FadeTransitionPageRoute(const Home(), settings: args);
      case Register.ROUTE_NAME:
        return FadeTransitionPageRoute(const Register(), settings: args);
      default:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  CupertinoPageRoute cupertinoNavigate(Widget widget) {
    return CupertinoPageRoute(builder: (BuildContext context) => widget);
  }
}

class FadeTransitionPageRoute extends CupertinoPageRoute {
  final Widget widget;

  FadeTransitionPageRoute(this.widget, {RouteSettings? settings})
      : super(settings: settings, builder: (BuildContext context) => widget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(opacity: animation, child: widget);
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 800);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
    Animation<double> onlyForwardAnimation;
    switch (animation.status) {
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        onlyForwardAnimation = kAlwaysCompleteAnimation;
        break;
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        onlyForwardAnimation = animation;
        break;
    }
    return theme.buildTransitions(
        this, context, onlyForwardAnimation, secondaryAnimation, child);
  }
}
