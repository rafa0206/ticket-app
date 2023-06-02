import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_app/entities/user.dart';

class UserRepository {
  static final UserRepository instance = UserRepository._();

  UserRepository._();

  Future<void> saveUser(User user) async {
    String userString = json.encode(user.toJson());
    var instance = await SharedPreferences.getInstance();
    await instance.setString('user.prefs', userString);
  }

  Future<User?> getUser() async {
    var instance = await SharedPreferences.getInstance();
    // String? userString = await instance.getString('user.prefs');
    String? userString = instance.getString('user.prefs');
    if (userString!.isEmpty) {
      return null;
    }
    Map userJson = json.decode(userString);
    User user = User.fromJson(userJson as Map<String, dynamic>);
    return user;
  }

  //logout
  /*Future<void> deleteUser() async {
    var instance = await SharedPreferences.getInstance();
    await instance.setString('user.prefs', '');
  }*/
}
