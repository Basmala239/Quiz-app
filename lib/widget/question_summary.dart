import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.getSummeryData,{super.key});
  final List<Map<String, Object>> getSummeryData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...getSummeryData.map((e) =>
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:e["user_answer"]==e["correct_answer"]?Colors.blueAccent:Colors.redAccent,
                      foregroundColor: Colors.white,
                      child: Text(e["question_number"].toString()),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e["question"].toString(),
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(e["user_answer"].toString(),
                            style: GoogleFonts.lato(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          Text(e["correct_answer"].toString(),
                            style: GoogleFonts.lato(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),

              ],
            ),
        ),
      ],
    );
  }
}
