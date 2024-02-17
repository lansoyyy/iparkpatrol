import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 250,
            ),
          ),
        ),
      ],
    );
  }
}
