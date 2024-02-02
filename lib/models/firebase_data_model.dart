import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections_match/models/data.dart';

/// Class fetching data from Firebase instance.
class FirebaseDataModel extends DataModel {
  late FirebaseFirestore db;
  late CollectionReference<Elections> electionsRef;
  late CollectionReference<Party> partiesRef;

  static FirebaseDataModel? _singleton;
  factory FirebaseDataModel() {
    _singleton ??= FirebaseDataModel._internal();
    return _singleton!;
  }

  /// The actual implementation of the constructor.
  ///
  /// This is internal only to prevent double instantiation.
  FirebaseDataModel._internal() {
    db = FirebaseFirestore.instance;
    electionsRef = db.collection('elections').withConverter(
        fromFirestore: (snapshot, _) => Elections.fromFirestore(snapshot.id, snapshot.data()!),
        toFirestore: (elections, _) => elections.toFirestore());
    partiesRef = db.collection('parties').withConverter(
        fromFirestore: (snapshot, _) => Party.fromFirestore(snapshot.id, snapshot.data()!),
        toFirestore: (party, _) => party.toFirestore());
  }

  @override
  Future<List<Elections>> loadElections({String? tag}) => electionsRef
      .get()
      .then((querySnapshot) => querySnapshot.docs.map((snapshot) => snapshot.data()).toList());

  // Note that this will not work if there are more than 10 IDs.
  // See discussion in https://github.com/firebase/flutterfire/discussions/9690.
  @override
  Future<List<Party>> loadParties(Elections elections) {
    return electionsRef.doc(elections.id).collection('parties').withConverter(
        fromFirestore: (snapshot, _) => Party.fromFirestore(snapshot.id, snapshot.data()!),
        toFirestore: (party, _) => party.toFirestore())
    .get()
        .then((querySnapshot) => querySnapshot.docs.map((partyRef) => partyRef.data()).toList());
  }
}
