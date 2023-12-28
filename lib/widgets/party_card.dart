import 'package:flutter/widgets.dart';

import '../models/data.dart';

class PartyCard extends StatelessWidget {
  Party party;

  PartyCard(this.party, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('TBD: Party card for ${party.name}');
  }

}