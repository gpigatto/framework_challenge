import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _padding = 16.0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          child: child,
        ),
      ),
    );
  }
}
