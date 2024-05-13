import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../auth/presentation/widgets/textfield/login_text_field.dart';
import 'enter_exit_page_int.dart';

class RegisterLoginPage extends StatefulWidget{
  const RegisterLoginPage({super.key});

  @override
  State<RegisterLoginPage> createState() => _RegisterLoginPageState();
}

class _RegisterLoginPageState extends State<RegisterLoginPage> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: 200,
          maxHeight: 50
      ),
      child: SizedBox(
        width: screenWidth * 0.2,
        child: AppLoginTextField(textController),
      ),
    );
  }
}
