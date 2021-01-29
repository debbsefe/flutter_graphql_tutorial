import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Center(
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
