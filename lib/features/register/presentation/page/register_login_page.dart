import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicion/features/register/presentation/button/next_button.dart';
import 'package:musicion/features/register/presentation/page/register_password_page.dart';

import '../../../../core/utils/presentation/scale_size.dart';
import '../../../auth/presentation/widgets/textfield/login_text_field.dart';

class RegisterLoginPage extends StatefulWidget {
  const RegisterLoginPage({super.key});

  @override
  State<RegisterLoginPage> createState() => _RegisterLoginPageState();
}

class _RegisterLoginPageState extends State<RegisterLoginPage> {
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
                  padding: EdgeInsets.only(bottom: screenHeight*0.04),

                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                    ),
                    child: Text('Регистрация',
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.center,
                        textScaler:
                            TextScaler.linear(ScaleSize.textScaleFactor(context, maxTextScaleFactor: 1.8))),
                  ),
                ),
                //(padding: EdgeInsets.only(bottom: screenHeight*0.02)),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    maxHeight: 50
                  ),
                  child: SizedBox(
                    width: screenWidth * 0.2,
                    child: AppLoginTextField(textController),
                  ),
                ),
                //Padding(padding: EdgeInsets.only(bottom: screenHeight*0.04)),
                Padding(
                  padding:  EdgeInsets.only(top:screenHeight*0.02),
                  child: NextButton(thisPage: widget, nextPage: const RegisterPasswordPage()),
                )
              ],
            ),
          ),
        ),
      );
  }
}
