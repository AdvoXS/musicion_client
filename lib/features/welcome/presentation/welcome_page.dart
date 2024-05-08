import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _animation;

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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                const Center(
                    child: Text('Your Things',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 56))),
                Center(
                  child: SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Платформа',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 32),
                        ),
                        const SizedBox(width: 10.0),
                        DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 32),
                          child: AnimatedTextKit(
                            pause: const Duration(milliseconds: 6000),
                            totalRepeatCount: 1,
                            animatedTexts: [
                              TypewriterAnimatedText('твоих вещей', speed: Duration(milliseconds: 170)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                   const SizedBox(height: 20),
                   Center(
                     child: Container(
                         decoration: BoxDecoration(
                           color: Colors.blue.shade600,
                           borderRadius: BorderRadius.circular(12),
                         ),
                       child: ElevatedButton(
                         style:
                         ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Colors.transparent),
                           shape: MaterialStateProperty.all(RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(12))
                           )
                         ),
                         onPressed: () {  },
                         child: const Padding(
                           padding: EdgeInsets.all(10.0),
                           child: Text("Начать сейчас",style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                         ),
                       ),
                     ),
                   )         ],
                          ),
              ))
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation _animation;

  WavePainter(this._animation);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(0, 0),
        const Offset(1000, 1000),
        <Color>[
          const Color(0xff0baecf),
          const Color(0xff2bc451),
          const Color(0xff0699b6),
        ],
        [
          0.0,
          0.61,
          1,
        ],
      )
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, size.height);

    for (int i = 0; i <= 30; i++) {
      path.lineTo(i * size.width / 10,
          size.height / 5 + sin(_animation.value + i * pi / 15) * 80);
    }

    path.lineTo(size.width, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
