import 'package:elections_match/models/data.dart';
import 'package:elections_match/widgets/party_card.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'matching_screen.dart';

class ElectionsScreen extends StatelessWidget {
  final Elections elections;

  const ElectionsScreen(this.elections, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        backgroundColor: appBarBackgroundColor(context),
        title: Text('Elections ${elections.name}')
    ),
    body: Column(
      children: [
        buildIntroSection(),
        if (elections.parties.isNotEmpty) buildPartiesList(),
        buildMatchingSection(context)
      ],
    ),
  );
  }

  Widget buildIntroSection() =>
      Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.amber[600],
        child: Column(
          children: [
            const Text('Description'),
            Text(elections.description)
          ],
        ));

  Widget buildPartiesList() =>
      Column(children: elections.parties.map((p) => PartyCard(p)).toList(),
     );


  Widget buildMatchingSection(BuildContext context) =>
      Column(children: [
        Text('Candidate matching'),
        ElevatedButton(
            onPressed: () => runElectionMatching(context),
            style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
            child: Text('Run election matching'))
      ],);


  runElectionMatching(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MatchingScreen(elections)));
  }
}
