import 'package:flutter/material.dart';

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
        controller: textController,
        autofillHints: const [AutofillHints.username],
        style: const TextStyle(color: Colors.white),
        decoration: DefaultInputDecoration('Логин или электронная почта'));
  }
}
