import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/models/ticket_model.dart';
import 'package:ticket_app/models/user_model.dart';
import 'package:ticket_app/ui/pages/login_page.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserModel()),
    ChangeNotifierProvider(create: (context) => TicketModel()),
  ], child: const TicketApp()));
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF-Mono',
        // primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(color: AppTheme.mainBlue),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginPage(),
      // home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
