import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';

//ignore: must_be_immutable
class DefaultForm extends StatelessWidget {
  String labelText;
  String hintText;
  TextInputType keyboardType;
  TextEditingController controller;
  FocusNode? focusNode;
  FocusNode? requestFocus;
  FormFieldValidator<String>? validator;
  Widget? iconForm;
  List<TextInputFormatter>? inputFormatters;

  DefaultForm({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.requestFocus,
    this.iconForm,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: AppTheme.mainBlue,
        ),
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        onFieldSubmitted: (value) {
          if (requestFocus != null) {
            FocusScope.of(context).requestFocus(requestFocus);
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: iconForm,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: AppTheme.mainBlue,
            fontFamily: 'SF-Mono',
            fontSize: 16,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppTheme.mainDarkGrey,
            fontFamily: 'SF-Mono',
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
