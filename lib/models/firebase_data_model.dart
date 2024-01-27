import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections_match/models/data.dart';

/// Class fetching data from Firebase instance.
class FirebaseDataModel extends DataModel {

  late FirebaseFirestore db;

  FirebaseDataModel() {
   db = FirebaseFirestore.instance;
  }

  @override
  Future<List<Elections>> loadElections({String? tag}) {
    return db.collection('elections').get().then((querySnapshot) {
      print('Successfully fetched elections data from firebase.');
      List<Elections> electionsList = [];
      for (var elections in querySnapshot.docs) {
        electionsList.add(Elections.fromFirebase(elections.id, elections.data()));
        print(elections.data());
      }
      return electionsList;
    });
  }

  @override
  Future<List<Party>> loadParties(Elections elections) {
    return db.collection('parties').where('id', whereIn: elections.parties).get()
        .then((querySnapshot) {
          print('Successfully fetched parties for elections ${elections.id}');
          List<Party> parties = [];
          for (var party in querySnapshot.docs) {
            parties.add(Party.fromFirebase(party.id, party.data()));
            print(party.data());
          }
          return parties;
    });
  }
}
