import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicion/features/register/presentation/page/register_login_page.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<RegisterPage> createState() => _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterLoginPage(),
    );
  }

}