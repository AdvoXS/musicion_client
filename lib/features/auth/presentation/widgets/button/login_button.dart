import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:musicion/app_page.dart';
import 'package:musicion/core/utils/app_properties.dart';
import 'package:musicion/features/auth/bloc/login_page_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/controller/get_util.dart';
import '../../../../../core/utils/presentation/enter_exit_page_route.dart';



class LoginButton extends StatefulWidget {
  Widget loginWigjet;
  final TextEditingController loginController;
  final GlobalKey<FormState> formKey;
  final TextEditingController passController;

  LoginButton(
      {super.key,
      required this.loginWigjet,
      required this.loginController,
      required this.passController, required this.formKey});

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool validated = false;
  bool disabled = true;
  bool _load = false;
  late final GlobalKey<FormState> formKey;
  Color backColor = const Color(0xffF1F1F1);
  final Color color = const Color(0xff222222);
  late Widget loginWigjet;
  late final TextEditingController loginController;

  late final TextEditingController passController;

  @override
  void initState() {
    super.initState();
    loginWigjet = widget.loginWigjet;
    loginController = widget.loginController;
    passController = widget.passController;
    formKey = widget.formKey;
  }

  @override
  Widget build(BuildContext context) {
    disabled = _load && !validated;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(12))),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Color.fromARGB(
                          backColor.alpha,
                          backColor.red ~/ 1.5,
                          backColor.green ~/ 1.5,
                          backColor.blue ~/ 1.5);
                    } else if (states.contains(MaterialState.disabled)) {
                      return Color.fromARGB(
                          backColor.alpha,
                          backColor.red ~/ 1.5,
                          backColor.green ~/ 1.5,
                          backColor.blue ~/ 1.5);
                    }
                    return backColor;
                  }),
                  foregroundColor: MaterialStateProperty.all(color)),
              onPressed: () {
                disabled ? null : tryLogin();
              },
              child: _load && validated
                  ? const Padding(
                      padding: EdgeInsets.all(6),
                      child: Center(
                          child: SizedBox(
                              width: 29,
                              height: 29,
                              child: CircularProgressIndicator(
                                color: Color(0xff1AAF8C)
                              ))))
                  : const Padding(
                      padding: EdgeInsets.all(6),
                      child: Center(
                          child: Text("Войти",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))))),
        ),
      ],
    );
  }

  tryLogin() async {
    validated = formKey.currentState!.validate();
    if(validated) {
      setState(() {
        _load = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      /*final SharedPreferences preferences = await SharedPreferences
          .getInstance();
      preferences.setString(PREFS_USERNAME, loginController.text);
      preferences.setString(PREFS_PASSWORD, passController.text);
      Response response = await getResource('')
          .timeout(
          const Duration(seconds: 5), onTimeout: () => Response('', 408));
      await Future.delayed(const Duration(seconds: 1));
      if (response.statusCode < 400 || response.statusCode == 404) {
        setState(() {
          Navigator.of(context).pop();
          Navigator.push(
              context,
              EnterExitRoute(
                  exitPage: loginWigjet,
                  enterPage: AppPage(title: 'Musicion')));
        });
      }*/
      LoginPageBloc bloc = BlocProvider.of<LoginPageBloc>(context);
      bloc.add(LoginPageTryAuthEvent(loginController.text));
      setState(() {
        _load = false;
      });
    }
  }
}
