import 'package:elections_match/models/data.dart';
import 'package:flutter/material.dart';

class MatchingResultsScreen extends StatelessWidget {
  final Elections elections;

  const MatchingResultsScreen(this.elections, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Matching candidates...')),
        body: Column(
            children: buildCandidateMatches() +
                [
                  ElevatedButton(
                      onPressed: () => backToElection(),
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20)),
                      child: const Text('Finish matching'))
                ]));
  }

  List<Widget> buildCandidateMatches() {
    var partyMatches = <Widget>[];
    for (final party in [] /*elections.getParties()*/) {
      partyMatches.add(Row(
        children: [
          const Text(
            '80%',
            style: TextStyle(fontSize: 18),
          ),
          const Spacer(),
          Text(party.name)
        ],
      ));
    }
    return partyMatches;
  }

  backToElection() {}
}
