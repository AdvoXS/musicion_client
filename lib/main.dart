import 'package:flutter/material.dart';
import 'package:musicion/app_page.dart';
import 'package:musicion/features/auth/presentation/login_page.dart';
import 'package:musicion/features/register/presentation/page/register_login_page.dart';

import 'core/controller/get_util.dart';
import 'core/utils/presentation/app_colors.dart';

void main() async {
  var loginResponse =
      await getMainAppData(true).timeout(const Duration(seconds: 10));
  bool isAuth = ![401, 403].contains(loginResponse.statusCode);
  runApp(MusicionApp(
    isAuth: isAuth,
  ));
}

class MusicionApp extends StatelessWidget {
  final bool isAuth;

  const MusicionApp({super.key, required this.isAuth});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musicion',
      theme: ThemeData(
        textTheme: const TextTheme(
                bodyLarge: TextStyle(),
                bodyMedium: TextStyle(),
                headlineMedium: TextStyle(),
                headlineSmall: TextStyle())
            .apply(
          bodyColor: AppColor.mainTextColor,
          displayColor: AppColor.mainTextColor,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        scaffoldBackgroundColor: AppColor.backgroundColor1,
        useMaterial3: true,
      ),
      home: isAuth ? const AppPage(title: 'Musicion') : RegisterLoginPage(),
    );
  }
}
