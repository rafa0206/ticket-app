import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/entities/user.dart';
import 'package:ticket_app/repository/api/user_api.dart';
import 'package:ticket_app/repository/local/database/user_repository.dart';

class UserModel extends ChangeNotifier {
  User? user;

  static UserModel of(BuildContext context) {
    return Provider.of<UserModel>(context, listen: false);
  }

  void login(String email, String password,
      {required Function() onSucess,
        required Function(String message) onFail}) async {
    user = await UserApi.instance.signIn(email, password);

    if (user != null) {
      await UserRepository.instance.saveUser(user!);
      onSucess();
    } else {
      onFail('Erro ao efetuar login para $email');
    }
  }

}
