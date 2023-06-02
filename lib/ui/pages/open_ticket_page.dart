import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/entities/ticket.dart';
import 'package:ticket_app/models/ticket_model.dart';
import 'package:ticket_app/models/user_model.dart';
import 'package:ticket_app/ui/validators/default_validator.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';
import 'package:ticket_app/ui/widgets/custom_button.dart';
import 'package:ticket_app/ui/widgets/default_form.dart';
import 'package:ticket_app/ui/widgets/message.dart';

//ignore: must_be_immutable
class OpenTicketPage extends StatefulWidget {
  const OpenTicketPage({super.key});

  @override
  State<OpenTicketPage> createState() => _OpenTicketPageState();
}

class _OpenTicketPageState extends State<OpenTicketPage> with DefaultValidator {

  final FocusNode _focusDescription = FocusNode();

  final _nameTicketController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'ABRIR\n CHAMADO',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                // color: AppTheme.mainBlue,
                fontFamily: 'SF-Mono',
                // fontSize: 14,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          // backgroundColor: Color(0xffF7F2F8),
          // backgroundColor: AppTheme.mainGrey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 26, left: 26),
                  child: Column(
                    children: [
                      DefaultForm(
                        requestFocus: _focusDescription,
                        controller: _nameTicketController,
                        keyboardType: TextInputType.text,
                        labelText: 'Nome',
                        hintText: 'Nome do chamado',
                        validator: validateText,
                      ),
                      const SizedBox(height: 20),
                      DefaultForm(
                        focusNode: _focusDescription,
                        controller: _descriptionController,
                        keyboardType: TextInputType.text,
                        labelText: 'Desrcição',
                        hintText: 'Descrião do chamado',
                        validator: validateText,
                      ),
                      const SizedBox(height: 16),
                      const Divider(
                        thickness: 1,
                        // color: Color(0xffBEBBBB),
                        color: AppTheme.mainDarkGrey,
                        // endIndent: 22,
                        // indent: 22,
                        // endIndent: 10,
                        // indent: 10,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onTap: () {
                          _openTicketOnPressed(context);
                          // _updateStock(context);
                        },
                        textButton: 'ABRIR CHAMADO',
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _openTicketOnPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Ticket ticket = Ticket(
      userCustomerId: 1560,
      customerId: UserModel.of(context).user!.id,
      subject: _nameTicketController.text,
      description: _descriptionController.text,
      newUserEmail: UserModel.of(context).user!.email,
    );

    TicketModel.of(context).openTicket(ticket, onSuccess: () {
      Message.onSuccess(
          scaffoldKey: _scaffoldKey,
          message: 'Chamado aberto com sucesso',
          seconds: 2,
          onPop: (value) {
            Navigator.of(context).pop();
          });
      _nameTicketController.text = '';
      _descriptionController.text = '';
      return;
    }, onFail: (String message) {
      Message.onFail(
        scaffoldKey: _scaffoldKey,
        message: message,
        seconds: 2,
      );
      return;
    });
  }
}
