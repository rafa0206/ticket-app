import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ticket_app/entities/user.dart';

class UserApi {
  static final UserApi instance = UserApi._();

  UserApi._();

  Future<User?> signIn(String email, String password) async {
    try {
      var econdeString = {
        "email": email,
        "password": password,
      };
      var encode = json.encode(econdeString);

      String url = 'https://api.projetos.innovareti.com.br/api/v1/login';

      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: encode,
      );
      if (response.statusCode == 200) {
        var responseData = json.decode(utf8.decode(response.bodyBytes));
        print('responseData: $responseData');
        // User user = User.fromJson(responseData['data']);
        User user = User.fromJson(responseData);
        return user;
      } else {
        return null;
      }
    } on Exception catch (error) {
      print("LOG[UsuarioApi.signIn] - error $error");
      return null;
    }
  }

  /*Future<void> signOut() async {
    try {
      String url = 'http://54.90.203.92/auth/logout';

      var response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return;
      } else {
        return null;
      }
    } on Exception catch (error) {
      print("LOG[UsuarioApi.signIn] - error $error");
      return null;
    }
  }*/
}
