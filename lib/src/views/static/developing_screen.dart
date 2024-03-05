import 'package:flutter/material.dart';

class DevelopingScreen extends StatelessWidget {
  const DevelopingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Developing")),
      body: const Center(
        child: Text("Page developing"),
      ),
    );
  }
}
