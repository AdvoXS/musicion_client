import 'package:flutter/material.dart';

import '../../../../../core/utils/presentation/constants.dart';

class AppPassTextField extends StatefulWidget {
  final TextEditingController controller;

  const AppPassTextField(this.controller, {super.key});

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<AppPassTextField> {
  late final TextEditingController textController;
  bool _secureText = true;

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
    void secureText() {
      setState(() {
        _secureText = !_secureText;
      });
    }

    return TextFormField(
      style: const TextStyle(color: Colors.white),
      validator: (value)  {
        if(value!.isEmpty) {
          return ("Пароль не может быть пустым");
        }
        if(value.length < 6){
          return ("Пароль не может содержать меньше 6 символов");
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textController,
      decoration: InputDecoration(
          border: InputBorders.border,
          enabledBorder: InputBorders.enabledBorder,
          focusedBorder: InputBorders.focusedBorder,
          errorBorder: InputBorders.errorBorder,
          focusedErrorBorder: InputBorders.focusedErrorBorder,
          disabledBorder: InputBorders.disabledBorder,
          labelText: 'Пароль',
          errorStyle: const TextStyle(color: Color(0xffff4444)),
          labelStyle: const TextStyle(color: Color(0xffdcdcdc)),
          suffixIcon: IconButton(
            //padding: const EdgeInsets.only(right: 5),
            onPressed: () {
              secureText();
            },
            icon: _secureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
          ),
          suffixIconColor: Colors.white,
          isDense: true
      ),
      obscureText: _secureText,
    );
  }
}
