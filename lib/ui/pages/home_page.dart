import 'package:flutter/material.dart';
import 'package:ticket_app/ui/pages/open_ticket_page.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';
import 'package:ticket_app/ui/widgets/list_tickets_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'TICKETS APP',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'SF-Mono',
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            const Expanded(child: ListTicketsCard()),
            const Divider(
              thickness: 1,
              color: AppTheme.mainBlue,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                textButton: 'ABRIR CHAMADO',
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const OpenTicketPage();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
