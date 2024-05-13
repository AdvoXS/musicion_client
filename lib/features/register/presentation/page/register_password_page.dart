import 'package:flutter/material.dart';

import '../button/register_text_field.dart';


class RegisterPasswordPage extends StatefulWidget{
  const RegisterPasswordPage({super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterPasswordPageState();

}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RegisterTextField(textController, 'Пароль'),
              RegisterTextField(textController, 'Подтвердите пароль'),
            ],
    );
  }
}
