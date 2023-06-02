import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static void onSuccess(
      {required GlobalKey<ScaffoldMessengerState> scaffoldKey,
        required String message,
        required int seconds,
        required Function onPop}) {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.mainBlue,
        duration: Duration(seconds: seconds ?? 3),
      ),
    );

    Future.delayed(Duration(seconds: seconds ?? 3), () {
      onPop();
    });
  }

  static void onFail(
      {required GlobalKey<ScaffoldMessengerState> scaffoldKey,
        required String message,
        required int seconds,
        Function? onPop}) {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.mainBlue,
        duration: Duration(seconds: seconds ?? 3),
      ),
    );
  }

  static Widget loading(BuildContext context,
      {double? width, double? height, double? strokeWidth, Color? color}) {
    return Center(
      child: SizedBox(
        width: width ?? 40,
        height: height ?? 40,
        child: CircularProgressIndicator(
          valueColor:
          const AlwaysStoppedAnimation<Color>(AppTheme.mainBlue),
          strokeWidth: strokeWidth ?? 5,
        ),
      ),
    );
  }

  static Widget alert(String message,
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return Center(
      child: Text(
        'Não foi possível obter os dados do servidor',
        style: TextStyle(
            fontSize: fontSize ?? 15,
            color: color ?? Colors.grey[600],
            fontWeight: fontWeight ?? FontWeight.bold),
      ),
    );
  }

  static void onCheckEmail(
      {required GlobalKey<ScaffoldMessengerState> scaffoldKey,
        required String message,
        required int seconds,
        Function? onPop}) {
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppTheme.mainBlue,
        duration: Duration(seconds: seconds ?? 3),
      ),
    );
  }
}
