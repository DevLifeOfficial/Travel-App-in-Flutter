import 'package:flutter/material.dart';

class Package extends StatelessWidget {
  const Package({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package'),
      ),
      body: const Center(
        child: Text('Package Page'),
      ),
    );
  }
}