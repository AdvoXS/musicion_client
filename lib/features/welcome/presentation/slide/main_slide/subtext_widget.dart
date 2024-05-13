import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTextWelcome extends StatelessWidget {
   SubTextWelcome({super.key});

  static const String strongText = 'Платформа';
  static const String typingText = 'твоих вещей';

  final TextStyle textStyle =
  GoogleFonts.nunitoSans(textStyle:TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 32));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Text(strongText, style: textStyle),
            const SizedBox(width: 10.0),
            DefaultTextStyle(
              style: textStyle,
              child: AnimatedTextKit(
                pause: const Duration(milliseconds: 6000),
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(typingText,
                      speed: const Duration(milliseconds: 170)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
