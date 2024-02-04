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
    return electionsRef
        .doc(elections.id)
        .collection('parties')
        .withConverter(
            fromFirestore: (snapshot, _) => Party.fromFirestore(snapshot.id, snapshot.data()!),
            toFirestore: (party, _) => party.toFirestore())
        .get()
        .then((querySnapshot) => querySnapshot.docs.map((partyRef) => partyRef.data()).toList());
  }

  @override
  Future<List<QuestionGroup>> loadGroups(Elections elections) {
    var collectionRef = electionsRef.doc(elections.id).collection('groups').withConverter(
        fromFirestore: (snapshot, _) => QuestionGroup.fromFirestore(snapshot),
        toFirestore: (group, _) => group.toFirestore());
    return collectionRef
        .get()
        .then((querySnapshot) => querySnapshot.docs.map((groupRef) => groupRef.data()).toList());
  }

  @override
  Future<List<Question>> loadQuestions(Elections elections, QuestionGroup group) {
    var collectionRef = electionsRef.doc(elections.id).collection('groups').doc(group.id).collection('questions').withConverter(
        fromFirestore: (snapshot, _) => Question.fromFirestore(snapshot),
        toFirestore: (question, _) => question.toFirestore());
    return collectionRef
        .get()
        .then((querySnapshot) => querySnapshot.docs.map((questionRef) => questionRef.data()).toList());
  }
}

class FirebaseElections implements Elections {
  Future<List<QuestionGroup>> getGroups(DataModel dataModel) async {
    if (_questionGroups != null) {
      return Future.value(_questionGroups);
    }
    return dataModel.loadGroups(this);
  }


  FirebaseElections.fromFirestore(this.id, Map<String, dynamic> data)
      : name = data['Name'],
        description = data['Description'],
        location = data['Location'],
        parties = data['parties'];

  Map<String, Object?> toFirestore() =>
      {'Name': name, 'Description': description, 'Location': location, 'parties': parties};
}

class FirebaseParty implements Party {

  FirebaseParty.fromFirestore(this.id, Map<String, dynamic> data)
      : name = data['name'],
        description = data['description'] ?? '';

  Map<String, Object?> toFirestore() => {'name': name, 'description': description};
}

class FirebaseCandidate implements Candidate {

}

class FirebaseQuestionGroup implements QuestionGroup {

  QuestionGroup.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        name = snapshot.data()!['name'],
        order = snapshot.data()!['order'];

  Map<String, Object?> toFirestore() => {'order': order, 'name': name};
}
class FirebaseQuestion implements Question {

  Question.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        order = snapshot.data()!['order'],
        text = snapshot.data()!['text'];

  Map<String, Object?> toFirestore() => {'order': order, 'text': text};
}
class FirebaseQuestionResponse implements QuestionResponse {

  QuestionResponse.fromFirestore(Map<String, dynamic> data)
      : response = data['response'],
        weight = data['weight'];

  Map<String, Object?> toFirestore() => {'response': response, 'weight': weight};
}

