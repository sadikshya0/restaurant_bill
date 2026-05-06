import 'package:flutter/material.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Points")),
      body: const Center(child: Text("Points Screen")),
    );
  }
}
