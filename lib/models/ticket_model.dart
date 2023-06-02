import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/entities/ticket.dart';
import 'package:ticket_app/repository/api/ticket_api.dart';

class TicketModel extends ChangeNotifier {
  Future<List<Ticket>?>? futureTickets;
  bool loading = false;

  static TicketModel of(BuildContext context) {
    return Provider.of<TicketModel>(context, listen: false);
  }

  Future<void> fetchTickets() async {
    loading = true;
    futureTickets = TicketApi.instance.getTickets();
    loading = false;
    notifyListeners();
  }

  void openTicket(Ticket ticket,
      {required Function() onSuccess,
        required Function(String message) onFail}) async {

    String? message = await TicketApi.instance.openTicket(ticket);
    if (message != null) {
      onSuccess();
    } else {
      onFail('Erro ao abrir chamado');
    }
    notifyListeners();

  }

}