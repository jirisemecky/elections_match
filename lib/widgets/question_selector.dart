import 'package:elections_match/models/data.dart';
import 'package:flutter/material.dart';

class QuestionSelector extends StatefulWidget {
  final Question question;
  final int number;

  const QuestionSelector(this.question, this.number, {super.key});

  @override
  State<StatefulWidget> createState() => _QuestionSelectorState();
}

class _QuestionSelectorState extends State<QuestionSelector> {
  static const ratherAnswerMultiplier = 0.5;
  static const cardColor = Colors.greenAccent;

  num? selected;
  double weight = 1;

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
      selected: selected == null ? {} : {selected},
      onSelectionChanged: selectionChanged,);
  }

  Widget buildWeightWidget() {
    return Row(children: [
      Text('Weight ${weight.toStringAsFixed(1)}:'),
      Slider(
        divisions: 4,
        min: 0.4,
        max: 1.6,
        label: 'Weight',
        value: weight,
        onChanged: weightChanged,
      )
    ],);
  }

  void selectionChanged(Set selection) {
    setState(() {
      selected = selection.firstOrNull;
    });
  }

  void weightChanged(double value) {
    setState(() {
      weight = value;
    });
  }
}
