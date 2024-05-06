import 'package:flutter/material.dart';
import 'package:musicion/features/register/presentation/button/register_text_field.dart';

import '../../../../core/utils/presentation/scale_size.dart';
import '../../../auth/presentation/widgets/textfield/default_input_decoration.dart';
import '../button/next_button.dart';

class RegisterPasswordPage extends StatefulWidget {
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.04),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                  ),
                  child: Text('Регистрация',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                      textScaler: TextScaler.linear(ScaleSize.textScaleFactor(
                          context,
                          maxTextScaleFactor: 1.8))),
                ),
              ),
              RegisterTextField(textController, 'Пароль'),
              RegisterTextField(textController, 'Подтвердите пароль'),
              NextButton(
                thisPage: widget,
                nextPage: const RegisterPasswordPage(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
