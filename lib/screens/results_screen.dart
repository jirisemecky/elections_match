import 'package:elections_match/models/data.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final Elections elections;

  const ResultsScreen(this.elections, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Matching candidates...')),
        body: Column(
            children: buildCandidateMatches() + buildPartyMatches() +
                [
                  const Padding(padding: EdgeInsets.all(20),
                    child: Text(
                        'Here we show candidates matching your personal answers, based on our similarity algorithm.')),
                  ElevatedButton(
                      onPressed: () => backToElection(context),
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20)),
                      child: const Text('Back to election overview'))
                ]));
  }

  List<Widget> buildCandidateMatches() {
    return [];
  }

  List<Widget> buildPartyMatches() {
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

  backToElection(BuildContext context) {
    // TODO(jirka): this is a bit dirty, better would be popUptil() if we can name the states.
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
