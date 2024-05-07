part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageState {}

class LoginPageInitial extends LoginPageState {}


class LoginPageTryAuthState extends LoginPageState{
  final String errorMessage;

  LoginPageTryAuthState(this.errorMessage);
}