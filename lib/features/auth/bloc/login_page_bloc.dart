import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../controller/login_page_controller.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitial()) {
    on<LoginPageLoadingEvent>((event, emit) {
      print('login page loading...');
    });
    on<LoginPageTryAuthEvent>((event, emit) async {
      final StatusFoundUser statusFoundUser =
          await LoginPageController.tryFindUser(event.userName);
      emit(LoginPageTryAuthState(statusFoundUser.errorMessage));
    });
  }
}
