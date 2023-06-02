import 'package:flutter/material.dart';
import 'package:ticket_app/entities/ticket.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';

//ignore: must_be_immutable
class TicketCard extends StatefulWidget {
  Ticket ticket;

  TicketCard({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppTheme.mainGrey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ticket.subject,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF-Mono',
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Status: ${widget.ticket.status}\n'
                      'Prioridade: ${widget.ticket.priority}\n',
                      style: const TextStyle(
                        color: AppTheme.mainDarkGrey,
                        fontFamily: 'SF-Mono',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
