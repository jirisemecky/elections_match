import 'package:elections_match/models/data.dart';
import 'package:elections_match/widgets/question_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionGroupWidget extends StatefulWidget {
  final QuestionGroup group;
  final Elections elections;

  QuestionGroupWidget(this.group, this.elections);

  @override
  State<StatefulWidget> createState() => _QuestionGroupWidgetState();


}

class _QuestionGroupWidgetState extends State<QuestionGroupWidget> {
  List<Question>? questions;

  @override
  void initState() {
    super.initState();
    widget.group.getQuestions().then((value) => setState(() => questions = value));
  }

  @override
  Widget build(BuildContext context) {
    var questionWidgets = <Widget>[];
    int i = 1;
    for (final question in questions??[]) {
      questionWidgets.add(QuestionSelector(widget.elections, question, i++));
    }

    return ListView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        children: <Widget>[AppBar(automaticallyImplyLeading: false, title: Text(widget.group.name))] +
            questionWidgets);
  }
}
