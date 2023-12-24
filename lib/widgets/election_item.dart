import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Class for displaying single election as an item of a list.
class ElectionItem extends StatelessWidget {

  String electionName;

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(20), margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), child: Text(electionName),
    decoration: BoxDecoration(color: Colors.blueGrey, border: Border.all(width: 8), borderRadius: BorderRadius.circular(10)),);
  }

  ElectionItem(this.electionName);
}
