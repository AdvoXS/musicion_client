import 'package:flutter/material.dart';
import 'package:musicion/features/register/presentation/button/register_text_field.dart';
import 'package:musicion/features/register/presentation/page/enter_exit_page_int.dart';

import '../../../../core/utils/presentation/scale_size.dart';
import '../../../auth/presentation/widgets/textfield/default_input_decoration.dart';
import '../button/next_button.dart';

class RegisterPasswordPage extends StatefulWidget implements EnterExitPage{
  const RegisterPasswordPage({super.key});

  @override
  State<RegisterPasswordPage> createState() => _RegisterPasswordPageState();

  @override
  EnterExitPage nextPage() {
    // TODO: implement nextPage
    throw UnimplementedError();
  }
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
