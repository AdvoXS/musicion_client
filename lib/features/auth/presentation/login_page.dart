import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicion/features/auth/bloc/login_page_bloc.dart';
import 'package:musicion/features/auth/presentation/widgets/button/login_button.dart';
import 'package:musicion/features/auth/presentation/widgets/button/register_button.dart';
import 'package:musicion/features/auth/presentation/widgets/textfield/login_text_field.dart';
import 'package:musicion/features/auth/presentation/widgets/textfield/pass_text_field.dart';

import '../../../core/utils/presentation/app_colors.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: BlocProvider.of<LoginPageBloc>(context),
        child: Scaffold(
            body: Form(
          key: _formKey,
          child: Center(
              child: Container(
                  constraints:
                      const BoxConstraints(minWidth: 250, maxWidth: 350),
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
                                    text: "Your",
                                    style: TextStyle(
                                      color: AppColor.primaryLogoTitleColor,
                                      fontSize: 48,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: "Things",
                                      style: TextStyle(
                                          color:
                                              AppColor.secondaryLogoTitleColor,
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
                          child: BlocBuilder<LoginPageBloc, LoginPageState>(
                            bloc: BlocProvider.of<LoginPageBloc>(context),
                            builder:
                                (BuildContext context, LoginPageState state) {
                              if (state is LoginPageTryAuthState) {
                                if (state.errorMessage != '') {
                                  return Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      //color: AppColor.errorColorBackground,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      border: Border.all(
                                          width: 1, color: AppColor.errorColor),
                                    ),
                                    child:
                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                            const Padding(padding: EdgeInsets.fromLTRB( 0, 0, 3, 2),
                                                child: Icon(Icons.person,
                                                color: AppColor.errorColor, size: 19)),
                                            Text(state.errorMessage,
                                                style: const TextStyle(
                                                    color: AppColor.errorColor,
                                                    fontWeight:
                                                        FontWeight.w600))
                                          ])
                                  );
                                } else {
                                  return Container();
                                }
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
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
                                child: LoginButton(
                                    loginWigjet: widget,
                                    passController: passController,
                                    loginController: loginController,
                                    formKey: _formKey))),
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
                  ))),
        )));
  }
}
