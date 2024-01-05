import 'package:elections_match/models/data.dart';
import 'package:flutter/material.dart';

class QuestionSelector extends StatelessWidget {
  final Question question;
  final int number;

  static const cardColor = Colors.greenAccent;

  const QuestionSelector(this.question, this.number, {super.key});

  @override
  Widget build(BuildContext context) => Card(
        color: cardColor,
        elevation: 10,
        shadowColor: Colors.black,
        child: Column(
          children: [
            Text('Question #$number'),
            Text(question.text),
            buildSelectorWidgert()
          ],
        ),
      );

  Widget buildSelectorWidgert() {
    var segments = <ButtonSegment>[
      const ButtonSegment(label: Text('Yes'), value: 1),
      const ButtonSegment(label: Text('Rather yes'), value: 0.5),
      const ButtonSegment(label: Text('Rather no'), value:-.5),
      const ButtonSegment(label: Text('No'), value: -1),
    ];
    return SegmentedButton(emptySelectionAllowed: true,
        segments: segments, selected: const {},
    onSelectionChanged: selectionChanged,);
  }
  void selectionChanged(Set p1) {
  }
}
