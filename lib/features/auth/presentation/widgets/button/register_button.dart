import 'package:flutter/material.dart';

import '../dialog/info_dialog.dart';

class RegisterButton extends StatelessWidget {
  final String label;
  final Color backColor;
  final Color color;

  const RegisterButton(this.label, this.backColor, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: TextButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.circular(12))),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Color.fromARGB(backColor.alpha, backColor.red ~/ 1.5,
                        backColor.green ~/ 1.5, backColor.blue ~/ 1.5);
                  }
                  return backColor;
                }),
                foregroundColor: MaterialStateProperty.all(color)),
            onPressed: () {
              const InfoDialog(
                      title: 'Отказано',
                      text: 'Регистрация на данный момент недоступна')
                  .showAlertDialog(context);
            },
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: Center(
                    child: Text(label,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)))),
          ),
        ),
      ],
    );
  }
}
