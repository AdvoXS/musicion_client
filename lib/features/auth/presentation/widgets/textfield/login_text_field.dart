import 'package:flutter/material.dart';

import '../../../../../core/utils/presentation/constants.dart';
import 'default_input_decoration.dart';

class AppLoginTextField extends StatefulWidget {
  final TextEditingController controller;

  const AppLoginTextField(this.controller, {super.key});

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<AppLoginTextField> {
  late final TextEditingController textController;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textController = widget.controller;
    //your code here
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => loginValidator(value),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textController,
        autofillHints: const [AutofillHints.username],
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            border: InputBorders.border,
            enabledBorder: InputBorders.enabledBorder,
            focusedBorder: InputBorders.focusedBorder,
            errorBorder: InputBorders.errorBorder,
            focusedErrorBorder: InputBorders.focusedErrorBorder,
            disabledBorder: InputBorders.disabledBorder,
            labelText: 'Логин или электронная почта',
            errorStyle: TextStyle(color: Color(0xffff4444)),
            labelStyle: TextStyle(
                color: Color(0xffdcdcdc), fontWeight: FontWeight.w400),
            isDense: true));
  }

  loginValidator(String? value) {
    RegExp regex = RegExp(r'^.{4,}$');
    if (value!.isEmpty) {
      return ("Не может быть пустым");
    }
    if (!regex.hasMatch(value)) {
      return ("Может содержать не менее 4 символов");
    }
    if (value.contains(':')) {
      return ("Не может содержать двоеточие");
    }
    if (value.contains('@')) {
      if (value.split('@').length > 2) {
        return ("Не может содержать более двух символов '@'");
      }
      RegExp mailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!mailRegex.hasMatch(value)) {
        return ("Неверный адрес электронной почты");
      }
    }
    return null;
  }
}
