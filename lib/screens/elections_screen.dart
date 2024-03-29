import 'package:elections_match/models/data.dart';
import 'package:elections_match/screens/matching_screen.dart';
import 'package:elections_match/widgets/party_card.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/material.dart';

class ElectionsScreen extends StatefulWidget {
  final DataModel dataModel;
  final Elections elections;

  const ElectionsScreen(this.dataModel, this.elections, {super.key});

  @override
  State<StatefulWidget> createState() => _ElectionScreenState();
}

class _ElectionScreenState extends State<ElectionsScreen> {
  List<Party>? partiesData;
  List<QuestionGroup>? groups;

  @override
  void initState() {
    super.initState();
    partiesData = [];
    groups = [];
    loadData();
  }

  void loadData() async {
    widget.elections.getParties().then((value) => setState(() => partiesData = value));
    widget.elections.getGroups().then((value) => setState(() => groups = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarBackgroundColor(context),
          title: Text('Elections ${widget.elections.name}')),
      body: Column(
        children: [buildIntroSection(), buildPartyList(), buildMatchingSection(context)],
      ),
    );
  }

  Widget buildPartyList() {
    if (partiesData == null) {
      return const LinearProgressIndicator();
    }

    if (partiesData!.isEmpty) {
      return const Text("No parties registered.");
    }

    return Column(children: partiesData!.map((p) => PartyCard(p)).toList());
  }

  Widget buildIntroSection() => Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.amber[600],
      child: Column(
        children: [const Text('Description'), Text(widget.elections.description)],
      ));

  Widget buildMatchingSection(BuildContext context) => Column(
        children: [
          const Text('Candidate matching'),
          Text('Question groups ${groups?.length ?? "... loading ..."}'),
          if ((groups?.length ?? 0) > 0)
            ElevatedButton(
                onPressed: () => runElectionMatching(context),
                style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                child: const Text('Run election matching'))
        ],
      );

  runElectionMatching(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MatchingScreen(widget.dataModel, widget.elections, groups!)));
  }
}
