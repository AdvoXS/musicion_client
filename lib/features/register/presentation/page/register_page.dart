import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/presentation/scale_size.dart';
import '../button/next_button.dart';
import 'enter_exit_page_int.dart';
import 'register_login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              const RegisterLoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}
