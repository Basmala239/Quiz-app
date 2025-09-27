import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widget/question_summary.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen(this.questionAnswer,this.restart, {super.key});
  final void Function() restart;
  final List<String> questionAnswer;

  List<Map<String, Object>> get summeryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < questionAnswer.length; i++) {
      summary.add({
        'question_number': i + 1,
        'question': questions[i].q,
        'correct_answer': questions[i].w[0],
        'user_answer': questionAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numberOfCorrectAnswer = summeryData
        .where((element) => element['correct_answer'] == element['user_answer'])
        .length;
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' You answered $numberOfCorrectAnswer out of ${questions
                  .length} correctly!',
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 24
                ),
                textAlign: TextAlign.center,),
              SizedBox(height: 30,),
              QuestionSummary(summeryData),
              SizedBox(height: 30,),
              TextButton.icon(
                  onPressed: restart,
                  icon: Icon(Icons.restart_alt_outlined, color: Colors.white,),
                  label: Text('Restart Quiz!',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ),)),
            ],
          ),
        )
    );
  }
}
