import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widget/answer_button_widget.dart';
class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});
  final void Function(String) onSelectedAnswer;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentQuestionIndex=0;
  void answerQuestion(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion =questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentQuestion.q,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 24
          ),
          textAlign: TextAlign.center,),
          SizedBox(height: 30,),
          ...currentQuestion.shuffledAnswer.map((e)=>Container(
            margin: const EdgeInsets.all(5),
            child: AnswerButton(onPressed: (){
              answerQuestion(e);
            }, answer: e)
          )
          ),
        ],
      ),
    );
  }
}
