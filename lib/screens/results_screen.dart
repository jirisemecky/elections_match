import 'package:elections_match/models/data.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  final Elections elections;

  const ResultsScreen(this.elections, {super.key});

  @override
  State<StatefulWidget> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultsScreen> {
  List<Candidate>? candidates;

  List<Party>? parties;


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

  void loadData() async {
    widget.elections.getCandidates().then((value) => setState(() => candidates = value));
    widget.elections.getParties().then((value) => setState(() => parties = value));
  }

  List<Widget> buildPartyMatches() {
    if (parties == null) return [];
    List<Widget> partyMatches = [];
    for (final party in parties!) {
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
