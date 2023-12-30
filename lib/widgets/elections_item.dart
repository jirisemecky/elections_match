import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';

/// Class for displaying single election as an item of a list.
class ElectionsListItem extends StatelessWidget {
  final Elections elections;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(width: 8),
          borderRadius: BorderRadius.circular(10)),
      child: Text(elections.name),
    );
  }

  ElectionsListItem(this.elections, {super.key});
}
