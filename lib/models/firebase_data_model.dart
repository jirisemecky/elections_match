// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:elections_match/models/data.dart';
//
// /// Class fetching data from Firebase instance.
// class FirebaseDataModel extends DataModel {
//   late FirebaseFirestore db;
//   late CollectionReference<FirebaseElections> electionsRef;
//   late CollectionReference<FirebaseParty> partiesRef;
//
//   static FirebaseDataModel? _singleton;
//
//   factory FirebaseDataModel() {
//     _singleton ??= FirebaseDataModel._internal();
//     return _singleton!;
//   }
//
//   /// The actual implementation of the constructor.
//   ///
//   /// This is internal only to prevent double instantiation.
//   FirebaseDataModel._internal() {
//     db = FirebaseFirestore.instance;
//     electionsRef = db.collection('elections').withConverter(
//         fromFirestore: (snapshot, _) => FirebaseElections.fromFirestore(snapshot),
//         toFirestore: (elections, _) => elections.toFirestore());
//     partiesRef = db.collection('parties').withConverter(
//         fromFirestore: (snapshot, _) => FirebaseParty.fromFirestore(snapshot.id, snapshot.data()!),
//         toFirestore: (party, _) => party.toFirestore());
//   }
//
//   @override
//   Future<List<FirebaseElections>> getElections({String? tag}) => electionsRef
//       .get()
//       .then((querySnapshot) => querySnapshot.docs.map((snapshot) => snapshot.data()).toList());
//
//   // Note that this will not work if there are more than 10 IDs.
//   // See discussion in https://github.com/firebase/flutterfire/discussions/9690.
//   @override
//   Future<List<Party>> loadParties(Elections elections) {
//     return electionsRef
//         .doc(elections.id)
//         .collection('parties')
//         .withConverter(
//             fromFirestore: (snapshot, _) => FirebaseParty.fromFirestore(snapshot.id, snapshot.data()!),
//             toFirestore: (party, _) => party.toFirestore())
//         .get()
//         .then((querySnapshot) => querySnapshot.docs.map((partyRef) => partyRef.data()).toList());
//   }
//
//   @override
//   Future<List<Question>> loadQuestions(Elections elections, QuestionGroup group) {
//     var collectionRef = electionsRef.doc(elections.id).collection('groups').doc(group.id).collection('questions').withConverter(
//         fromFirestore: (snapshot, _) => FirebaseQuestion.fromFirestore(snapshot),
//         toFirestore: (question, _) => question.toFirestore());
//     return collectionRef
//         .get()
//         .then((querySnapshot) => querySnapshot.docs.map((questionRef) => questionRef.data()).toList());
//   }
// }
//
// class FirebaseElections implements Elections {
//   DocumentReference<Map<String, dynamic>> reference;
//   Map<String, dynamic> data;
//
//   @override
//   String get name => data['name'];
//
//   @override
//   String get description => data['Description'];
//
//   @override
//   String get location => data['Location'];
//
//   List<FirebaseQuestionGroup>? _groupCache;
//
//   @override
//   Future<List<QuestionGroup>> getGroups() async {
//     if (_groupCache != null) {
//       return Future.value(_groupCache);
//     }
//
//     var collectionRef = reference.doc(elections.id).collection('groups').withConverter(
//         fromFirestore: (snapshot, _) => FirebaseQuestionGroup.fromFirestore(snapshot),
//         toFirestore: (group, _) => group.toFirestore());
//       return collectionRef
//           .get()
//           .then((querySnapshot) => querySnapshot.docs.map((groupRef) => groupRef.data()).toList());
//
//
//
//     return dataModel.loadGroups(this);
//   }
//
//
//   @override
//   Future<List<Party>> getParties() {
//     // TODO: implement getParties
//     throw UnimplementedError();
//   }
//
//   FirebaseElections.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
//       : reference =snapshot.reference,
//         data = snapshot.data();
//
//   Map<String, Object?> toFirestore() =>
//       {'Name': name, 'Description': description, 'Location': location, 'parties': parties};
// }
//
// class FirebaseParty implements Party {
//
//   FirebaseParty.fromFirestore(this.id, Map<String, dynamic> data)
//       : name = data['name'],
//         description = data['description'] ?? '';
//
//   Map<String, Object?> toFirestore() => {'name': name, 'description': description};
// }
//
// class FirebaseCandidate implements Candidate {
//
// }
//
// class FirebaseQuestionGroup implements QuestionGroup {
//
//   QuestionGroup.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
//       : id = snapshot.id,
//         name = snapshot.data()!['name'],
//         order = snapshot.data()!['order'];
//
//   Map<String, Object?> toFirestore() => {'order': order, 'name': name};
// }
// class FirebaseQuestion implements Question {
//
//   Question.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
//       : id = snapshot.id,
//         order = snapshot.data()!['order'],
//         text = snapshot.data()!['text'];
//
//   Map<String, Object?> toFirestore() => {'order': order, 'text': text};
// }
// class FirebaseQuestionResponse implements QuestionResponse {
//
//   QuestionResponse.fromFirestore(Map<String, dynamic> data)
//       : response = data['response'],
//         weight = data['weight'];
//
//   Map<String, Object?> toFirestore() => {'response': response, 'weight': weight};
// }
//
