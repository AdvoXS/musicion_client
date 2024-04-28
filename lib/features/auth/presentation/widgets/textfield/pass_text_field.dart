import 'package:flutter/material.dart';

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
      controller: textController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xffffffff), width: 2)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xffffffff), width: 2)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xffFFFFFF), width: 3)),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xffff4444), width: 2)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xffff4444), width: 3)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: Color(0xff6c6c6c), width: 2)),
          labelText: 'Пароль',
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
