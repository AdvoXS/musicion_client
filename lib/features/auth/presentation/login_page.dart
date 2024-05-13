import 'package:flutter/material.dart';

import '../../../core/utils/presentation/app_colors.dart';
import 'widgets/button/login_button.dart';
import 'widgets/button/register_button.dart';
import 'widgets/textfield/login_text_field.dart';
import 'widgets/textfield/pass_text_field.dart';

class LoginPage extends StatelessWidget {
  final String title;
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LoginPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                constraints: const BoxConstraints(minWidth: 250, maxWidth: 350),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: RichText(
                              text: const TextSpan(
                                  text: "MUSIC",
                                  style: TextStyle(
                                    color: AppColor.primaryLogoTitleColor,
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "ion",
                                    style: TextStyle(
                                        color: AppColor.secondaryLogoTitleColor,
                                        fontSize: 48,
                                        fontWeight: FontWeight.w800,
                                        shadows: <Shadow>[
                                          Shadow(
                                              offset: Offset(0, 4.0),
                                              blurRadius: 12,
                                              color:
                                                  Color.fromARGB(64, 0, 0, 0))
                                        ])),
                              ]))),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: AppLoginTextField(loginController)),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: AppPassTextField(passController)),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: SizedBox(
                              width: double.infinity,
                              child: LoginButton(loginWigjet: this, passController: passController, loginController: loginController))),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(8, 24.0, 8, 0),
                          child: Text('или:',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white))),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: SizedBox(
                              width: double.infinity,
                              child: RegisterButton('Создать аккаунт',
                                  Color(0xff1AAF8C), Color(0xffF1F1F1))))
                    ],
                  ),
                )
            )
        )
    );
  }
}
