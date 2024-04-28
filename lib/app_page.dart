import 'package:flutter/material.dart';

class AppPage extends StatelessWidget {
  final String title;

  AppPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is main page', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }
}