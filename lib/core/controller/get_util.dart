import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_properties.dart';


Future<Response> getMainAppData(bool withHeader) async{
  return getResource('');
}

Future<Response> getResource(String resource) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  
  String username = prefs.getString(PREFS_USERNAME) ?? '';
  String password = prefs.getString(PREFS_PASSWORD) ?? '';
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('$username:$password'))}';

  return get(
      Uri.parse('http://91.186.196.51:8080/'),
      headers:  <String, String>{'authorization': basicAuth}
  );
}

