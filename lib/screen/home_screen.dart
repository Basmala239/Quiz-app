
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen(this.switchScreen,{super.key});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/quiz-logo.png', width: 300,
              color: Colors.white.withOpacity(0.5),),
            SizedBox(height: 80,),
            Text('Learn Flutter!',
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24
              ),),
            SizedBox(height: 50,),
            OutlinedButton.icon(
              onPressed: switchScreen,
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              icon: Icon(Icons.arrow_right_alt_outlined),
              label: Text('Start Quiz'),)
          ],
        )
    );
  }
}

