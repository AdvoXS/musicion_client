import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicion/features/register/presentation/page/enter_exit_page_int.dart';
import 'package:musicion/features/register/presentation/page/register_login_page.dart';

import '../../../../core/utils/presentation/scale_size.dart';
import '../../../auth/presentation/widgets/textfield/login_text_field.dart';
import '../button/next_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  EnterExitPage thisPageValue = RegisterLoginPage();
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
              //(padding: EdgeInsets.only(bottom: screenHeight*0.02)),
              thisPageValue,
              //Padding(padding: EdgeInsets.only(bottom: screenHeight*0.04)),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.02),
                child: NextButton(
                    thisPage: thisPageValue, nextPage: thisPageValue = nextPage()),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  EnterExitPage nextPage() {
    return thisPageValue.nextPage();
  }
}
