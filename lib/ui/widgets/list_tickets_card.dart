import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/models/ticket_model.dart';
import 'package:ticket_app/ui/widgets/message.dart';
import 'package:ticket_app/ui/widgets/ticket_card.dart';

//ignore: must_be_immutable
class ListTicketsCard extends StatefulWidget {
  const ListTicketsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ListTicketsCard> createState() => _ListTicketsCardState();
}

class _ListTicketsCardState extends State<ListTicketsCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reload();
    });
  }

  void _reload() {
    TicketModel.of(context).fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TicketModel>(
        builder: (BuildContext context, TicketModel ticketModel, Widget? widget) {
          return FutureBuilder(
            future: ticketModel.futureTickets,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Message.alert(
                      'Não foi possível obter os dados decessários');
                case ConnectionState.waiting:
                  return Center(
                    child: Message.loading(context),
                  );
                default:
                  if (snapshot.hasError) {
                    return Message.alert(
                        'Não foi possível obter os dados do servidor');
                  } else if (!snapshot.hasData) {
                    return Message.alert(
                        'Não foi possível obter os dados dos estoques');
                  } else if (snapshot.data!.isEmpty) {
                    return Message.alert('Nenhum carro encontrado');
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _reload();
                      },
                      child: ListView.builder(
                          itemCount: snapshot.data?.length ?? 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TicketCard(
                                ticket: snapshot.data![index],
                              ),
                            );
                          }),
                    );
                  }
              }
            },
          );
        });
  }
}
