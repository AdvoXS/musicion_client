import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/controller/get_util.dart';
import 'core/utils/presentation/app_colors.dart';
import 'features/auth/bloc/login_page_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/app/app_page.dart';
import 'features/auth/presentation/login_page.dart';

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
  static const String appTitle = 'YourThings';

  const MusicionApp({super.key, required this.isAuth});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginPageBloc(),
        child: MaterialApp(
          title: appTitle,
          theme: ThemeData(
            textTheme:
                GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)
                    .apply(
              bodyColor: AppColor.mainTextColor,
              displayColor: AppColor.mainTextColor,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            scaffoldBackgroundColor: AppColor.backgroundColor2,
            useMaterial3: true,
          ),
          home: isAuth
              ? const AppPage(title: appTitle)
              : LoginPage(title: appTitle),
        ));
  }
}
