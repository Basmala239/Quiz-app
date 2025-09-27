import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onPressed});
  final String answer;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        backgroundColor: WidgetStatePropertyAll(Colors.deepPurple[900]),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40,vertical: 15)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ))
      ),
        onPressed: onPressed,
        child: Text(answer,
        textAlign: TextAlign.center,
            style: GoogleFonts.lato()));
  }
}
