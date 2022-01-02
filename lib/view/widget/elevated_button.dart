import 'package:flutter/material.dart';

class RedElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  const RedElevatedButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(""),
    );
  }
}
