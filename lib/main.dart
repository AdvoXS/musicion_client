import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/app/app_page.dart';
import 'core/controller/get_util.dart';
import 'core/utils/presentation/app_colors.dart';
import 'features/welcome/presentation/welcome_page.dart';

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
      title: 'YourThings',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: AppColor.backgroundColor2,
        useMaterial3: true,
      ),
      home: isAuth ? AppPage(title: 'YourThings') : WelcomePage(),
    );
  }
}
