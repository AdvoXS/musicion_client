import 'package:http/http.dart';


enum StatusFoundUser{
  notFound(errorMessage : 'Пользователь не найден'),
  found(errorMessage: ''),
  badRequest(errorMessage: 'Ошибка получения данных о пользователе');

  const StatusFoundUser({required this.errorMessage});
  final String errorMessage;

}

class LoginPageController {
  static Map<int, StatusFoundUser> httpCodeToEnumMap = {
    404: StatusFoundUser.notFound,
    200: StatusFoundUser.found,
    500: StatusFoundUser.badRequest
  };

  static Future<StatusFoundUser> tryFindUser(String userName) async {
    return get(Uri.parse(
            'http://localhost:8080/open-api/checkUser?username=$userName'))
        .then((value) => _httpCodeToEnum(value));
  }

  static StatusFoundUser _httpCodeToEnum(Response response) {
    return httpCodeToEnumMap[response.statusCode] ?? StatusFoundUser.badRequest;
  }
}
