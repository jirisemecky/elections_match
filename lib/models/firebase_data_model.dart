import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elections_match/models/data.dart';

/// Class fetching data from Firebase instance.
class FirebaseDataModel extends DataModel {
  late FirebaseFirestore db;
  late CollectionReference<FirebaseElections> electionsRef;
  late CollectionReference<FirebaseParty> partiesRef;

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
        fromFirestore: (snapshot, _) => FirebaseElections.fromFirestore(snapshot),
        toFirestore: (elections, _) => elections.toFirestore());
    partiesRef = db.collection('parties').withConverter(
        fromFirestore: (snapshot, _) => FirebaseParty.fromFirestore(snapshot),
        toFirestore: (party, _) => party.toFirestore());
  }

  @override
  Future<List<FirebaseElections>> getElections({String? tag}) => electionsRef
      .get()
      .then((querySnapshot) => querySnapshot.docs.map((snapshot) => snapshot.data()).toList());
}

class FirebaseElections implements Elections {
  DocumentReference<Map<String, dynamic>> reference;
  Map<String, dynamic> data;

  @override
  String get name => data['Name'];

  @override
  String get description => data['Description'];

  @override
  String get location => data['Location'];

  List<FirebaseQuestionGroup>? _loadedGroups;
  List<FirebaseParty>? _loadedParties;
  List<FirebaseCandidate>? _loadedCandidates;

  @override
  Future<List<FirebaseQuestionGroup>> getGroups() async {
    if (_loadedGroups != null) return Future.value(_loadedGroups);

    var collectionRef = reference.collection('groups').withConverter(
        fromFirestore: (snapshot, _) => FirebaseQuestionGroup.fromFirestore(snapshot),
        toFirestore: (group, _) => group.toFirestore());
    return collectionRef
        .get()
        .then((querySnapshot) => querySnapshot.docs.map((groupRef) => groupRef.data()).toList());
  }

  @override
  Future<List<FirebaseParty>> getParties() {
    if (_loadedParties != null) return Future.value(_loadedParties);

    var collectionRef = reference.collection('parties').withConverter(
        fromFirestore: (snapshot, _) => FirebaseParty.fromFirestore(snapshot),
        toFirestore: (party, _) => party.toFirestore());
    return collectionRef
        .get()
        .then((partySnapshot) => partySnapshot.docs.map((partyRef) => partyRef.data()).toList());
  }

  @override
  Future<List<FirebaseCandidate>> getCandidates() {
    if (_loadedCandidates != null) return Future.value(_loadedCandidates);

    var collectionRef = reference.collection('candidated').withConverter(
        fromFirestore: (snapshot, _) => FirebaseCandidate.fromFirestore(snapshot),
        toFirestore: (candidate, _) => candidate.toFirestore());
    return collectionRef.get().then((candidatesSnapshot) =>
        candidatesSnapshot.docs.map((candidatesRef) => candidatesRef.data()).toList());
  }

  FirebaseElections.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : reference = snapshot.reference,
        data = snapshot.data()!;

  Map<String, Object?> toFirestore() =>
      {'Name': name, 'Description': description, 'Location': location};
}

class FirebaseParty implements Party {
  DocumentReference<Map<String, dynamic>> reference;
  Map<String, dynamic> data;

  FirebaseParty.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : reference = snapshot.reference,
        data = snapshot.data()!;

  Map<String, Object?> toFirestore() => {'name': name, 'description': description};

  @override
  String get description => data['description'];

  @override
  String get name => data['name'];

  String get id => reference.id;
}

class FirebaseQuestionGroup implements QuestionGroup {
  DocumentReference<Map<String, dynamic>> reference;
  Map<String, dynamic> data;
  List<FirebaseQuestion>? _loadedQuestions;

  FirebaseQuestionGroup.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : reference = snapshot.reference,
        data = snapshot.data()!;

  Map<String, Object?> toFirestore() => {'order': order, 'name': name};

  @override
  Future<List<FirebaseQuestion>> getQuestions() {
    if (_loadedQuestions != null) return Future.value(_loadedQuestions);

    return reference
        .collection('questions')
        .withConverter(
            fromFirestore: (snapshot, _) => FirebaseQuestion.fromFirestore(snapshot),
            toFirestore: (question, _) => question.toFirestore())
        .get()
        .then((questionSnapshot) =>
            questionSnapshot.docs.map((questionRef) => questionRef.data()).toList());
  }

  @override
  String get name => data['name'];

  @override
  num? get order => data['order'];
}

class FirebaseQuestion implements Question {
  DocumentReference<Map<String, dynamic>> reference;
  Map<String, dynamic> data;

  FirebaseQuestion.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : reference = snapshot.reference,
        data = snapshot.data()!;

  Map<String, Object?> toFirestore() => {'order': order, 'text': text};

  @override
  num? get order => data['order'];

  @override
  String get text => data['text'];
}

class FirebaseQuestionResponse implements QuestionResponse {
  @override
  double? response;

  @override
  double? weight;

  FirebaseQuestionResponse(this.response);

  FirebaseQuestionResponse.withWeight(this.response, this.weight);

  FirebaseQuestionResponse.empty()
      : response = 0,
        weight = 1;
}

class FirebaseCandidate implements Candidate {
  DocumentReference<Map<String, dynamic>> reference;
  Map<String, dynamic> data;

  FirebaseCandidate.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : reference = snapshot.reference,
        data = snapshot.data()!;

  Map<String, Object?> toFirestore() => {'firstName': firstName, 'lastName': lastName};

  @override
  String get firstName => data['firstName'];

  @override
  String get lastName => data['lastName'];

  @override
  // TODO: implement party
  Party get party => throw UnimplementedError();
}
