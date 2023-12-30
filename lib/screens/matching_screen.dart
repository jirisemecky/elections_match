import 'package:elections_match/models/data.dart';
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
        children: [
        ],
      ),
    );
  }

}