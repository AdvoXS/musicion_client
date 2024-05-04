import 'package:flutter/material.dart';
import 'package:musicion/features/app/mobile/mobile_page.dart';

class AppPage extends StatelessWidget {
  final String title;

  const AppPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return const MobileLayout();
  }
}