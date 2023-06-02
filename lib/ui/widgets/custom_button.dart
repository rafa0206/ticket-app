import 'package:flutter/material.dart';
import 'package:ticket_app/ui/widgets/app_theme_data.dart';

//ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String textButton;
  VoidCallback onTap;

  CustomButton({
    super.key,
    required this.textButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          backgroundColor: MaterialStateProperty.all(AppTheme.mainBlue),
        ),
        onPressed: onTap,
        child: Text(
          textButton,
          style: const TextStyle(
              fontFamily: 'SF-Mono', fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
