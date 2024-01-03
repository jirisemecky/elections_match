import 'package:elections_match/models/data.dart';
import 'package:elections_match/widgets/question_selector.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MatchingScreen extends StatelessWidget {
  final Elections elections;

  const MatchingScreen(this.elections, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarBackgroundColor(context),
          title: Text('Matching candidates for ${elections.name}')
      ),
      body: Column(
        children: buildQuestionGroups(),
      ),
    );
  }

  List<Widget> buildQuestionGroups() {
    var results = <Widget>[];
    int i = 1;
    for (var group in elections.questionGroups) {
      for (var question in group.questions) {
        results.add(QuestionSelector(question, i++));
      }
    }
    return results;
  }


}