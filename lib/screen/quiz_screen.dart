import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screen/questions_screen.dart';
import 'package:quiz_app/screen/result_screen.dart';
import 'home_screen.dart';
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? currentScreen;
  List<String>questionAnswer=[];
  @override
  void initState() {
    super.initState();
    currentScreen= HomeScreen(switchScreen);
  }
  void addAnswer(String answer){
    questionAnswer.add(answer);
    if(questionAnswer.length == questions.length){
      setState(() {
        currentScreen=ResultScreen(questionAnswer,restart);
      });
    }
  }
  void switchScreen(){
    setState(() {
      currentScreen=Questions(onSelectedAnswer:addAnswer);
    });
  }
  void restart(){
    setState(() {
      questionAnswer = [];
      currentScreen = HomeScreen(switchScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.deepPurple,
                  Colors.purpleAccent
                ])
            ),
            child: currentScreen
        ),
      ),
    );
  }
}