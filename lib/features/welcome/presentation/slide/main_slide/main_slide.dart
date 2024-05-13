import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/button/welcome_start_button.dart';
import 'subtext_widget.dart';
import 'wave_painter.dart';

class WelcomeMainSlide extends StatefulWidget {
  const WelcomeMainSlide({super.key});

  @override
  State<WelcomeMainSlide> createState() => _WelcomeMainSlideState();
}

class _WelcomeMainSlideState extends State<WelcomeMainSlide> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _animationController.forward();
    _animationController.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: WavePainter(_animation),
              child: Container(),
            );
          },
        ),
         Center(
            child: SizedBox(
              width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text('Your Things',
                          style: GoogleFonts.nunitoSans(textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 56)))),
                  SubTextWelcome(),
                  const SizedBox(height: 20),
                  const Center(child: WelcomeStartButton())
                ],
              ),
            ))
      ],
    );
  }
}
