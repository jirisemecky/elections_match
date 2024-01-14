import 'package:elections_match/models/data.dart';
import 'package:elections_match/models/user_storage.dart';
import 'package:flutter/material.dart';

class QuestionSelector extends StatefulWidget {
  final Elections elections;
  final Question question;
  final int number;

  const QuestionSelector(this.elections, this.question, this.number, {super.key});

  @override
  State<StatefulWidget> createState() => _QuestionSelectorState(elections, question);
}

class _QuestionSelectorState extends State<QuestionSelector> {
  static const ratherAnswerMultiplier = 0.5;
  static const cardColor = Colors.greenAccent;

  QuestionResponse data;


  _QuestionSelectorState(Elections elections, Question question)
      : this.data = getUserStorage().getElections(elections).getQuestion(question);

  @override
  Widget build(BuildContext context) =>
      Card(
        color: cardColor,
        elevation: 10,
        shadowColor: Colors.black,
        child: Column(
          children: [
            Text('Question #${widget.number}'),
            Text(widget.question.text),
            buildSelectorWidget(),
            buildWeightWidget()
          ],
        ),
      );

  Widget buildSelectorWidget() {
    var segments = <ButtonSegment>[
      const ButtonSegment(icon: Icon(Icons.question_mark_outlined), label: Text('Yes'), value: 1),
      const ButtonSegment(icon: Icon(Icons.question_mark_outlined),
          label: Text('Rather yes'),
          value: ratherAnswerMultiplier),
      const ButtonSegment(icon: Icon(Icons.question_mark_outlined),
          label: Text('Rather no'),
          value: -ratherAnswerMultiplier),
      const ButtonSegment(icon: Icon(Icons.question_mark_outlined), label: Text('No'), value: -1),
    ];
    return SegmentedButton(emptySelectionAllowed: true,
      segments: segments,
      selected: {data.response},
      onSelectionChanged: selectionChanged,);
  }

  Widget buildWeightWidget() {
    return Row(children: [
      Text('Weight ${data.weight?.toStringAsFixed(1)}:'),
      Slider(
        divisions: 4,
        min: 0.4,
        max: 1.6,
        label: 'Weight',
        value: data.weight ?? 1,
        onChanged: weightChanged,
      )
    ],);
  }

  void selectionChanged(Set selection) {
    setState(() {
      data.response = selection.firstOrNull;

    });
  }

  void weightChanged(double value) {
    setState(() {
      data.weight = value;
    });
  }
}
