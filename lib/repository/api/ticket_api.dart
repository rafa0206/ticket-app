import 'dart:convert';
import 'dart:io';

import 'package:ticket_app/entities/ticket.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_app/entities/user.dart';
import 'package:ticket_app/repository/local/database/user_repository.dart';

class TicketApi {
  static final TicketApi instance = TicketApi._();

  TicketApi._();

  Future<List<Ticket>?> getTickets() async {
    List<Ticket>? tickets;
    try {
      String url =
          'https://api.projetos.innovareti.com.br/api/public/v1/new_tickets?sentByEmail=candidato@innovareti.com.br&ticketCode=&subject=&processName=&statusId=&createdAt=';
      User? user = await UserRepository.instance.getUser();
      String authorization = 'Bearer ${user?.token}';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          'Authorization': authorization,
        },
      );

      if (response.statusCode != 200) {
        return null;
      }

      var responseData = json.decode(utf8.decode(response.bodyBytes));
      tickets = (responseData as List).map((json) {
        return Ticket.fromJson(json as Map<String, dynamic>);
      }).toList();

      return tickets;
    } on Exception {
      return null;
    }
  }

  Future<String?> openTicket(Ticket ticket) async {
    try {
      var map = <dynamic, dynamic>{};
      map['usercustomer_id'] = '${ticket.userCustomerId}';
      map['customer_id'] = '${ticket.customerId}';
      map['subject'] = ticket.subject;
      map['description'] = ticket.description;
      map['new_user_email'] = ticket.newUserEmail;
      map['process_name_id'] = '';
      map['process_area_id'] = '';
      map['attachment'] = '';

      String url =
          'https://api.projetos.innovareti.com.br/api/public/v1/new_ticket/add?Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBpLnByb2pldG9zLmlubm92YXJldGkuY29tLmJyXC9hcGlcL3YxXC9sb2dpbiIsImlhdCI6MTY4NTU1NDcwNywibmJmIjoxNjg1NTU0NzA3LCJqdGkiOiJSUWhoeEx2MHU1V0lkSHA4Iiwic3ViIjo0NCwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.VIB9yzqvhvvWLvYDAV__wT66sCVhkYDKEknYejgAIdo';
      User? user = await UserRepository.instance.getUser();
      String authorization = 'Bearer ${user?.token}';

      var response = await http.post(
        Uri.parse(url),
        headers: {'Authorization': authorization},
        body: map,
      );
      if (response.statusCode == 200) {
        String message = 'Chamado aberto';
        return message;
      } else {
        return null;
      }
    } on Exception {
      return null;
    }
  }
}
