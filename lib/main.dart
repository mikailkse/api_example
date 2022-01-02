import 'package:apiexample/core/auth/auth_manager.dart';
import 'package:apiexample/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/cache/local_manager.dart';

Future<void> main() async {
  runApp(MultiProvider(providers: [
    Provider<AuthenticationManager>(
      create: (context) => AuthenticationManager(context: context),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Splash(),
    );
  }
}
