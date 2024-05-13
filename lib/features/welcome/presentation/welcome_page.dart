import 'package:YourThings/features/welcome/presentation/slide/main_slide/main_slide.dart';
import 'package:YourThings/features/welcome/presentation/widgets/page_view/welcome_page_view.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: WelcomePageView(children: [WelcomeMainSlide(), Text('1')]));
  }
}
