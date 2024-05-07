part of 'login_page_bloc.dart';

@immutable
abstract class LoginPageEvent {}

class LoginPageLoadingEvent extends LoginPageEvent {}

class LoginPageTryAuthEvent extends LoginPageEvent {
    final String userName;

    LoginPageTryAuthEvent(this.userName);
}
