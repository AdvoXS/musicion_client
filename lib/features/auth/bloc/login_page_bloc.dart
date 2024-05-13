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
      StatusFoundUser statusFoundUser;
      try {
        statusFoundUser =
        await LoginPageController.tryFindUser(event.userName);
      }
      catch(err) {
        statusFoundUser = StatusFoundUser.badRequest;
      }
      emit(LoginPageTryAuthState(statusFoundUser.errorMessage));
    });
  }
}
