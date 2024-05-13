import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeStartButton extends StatelessWidget {
  const WelcomeStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade800,
            borderRadius: BorderRadius.circular(32)),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)))),
          onPressed: () {},
          child:  Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Начать сейчас",
                style: GoogleFonts.nunitoSans(textStyle:TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300))),
          ),
        ));
  }
}
