import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

/// Model providing interface for fetching data.
abstract class DataModel {
  Future<List<Elections>> loadElections({String? tag});

  Future<List<Party>> loadParties(Elections elections);

  Future<List<QuestionGroup>> loadGroups(Elections elections);

  Future<List<Question>> loadQuestions(Elections elections, QuestionGroup group);
}

class Elections {
  final String id;

  final String name;
  final String description;
  final String location;

  Iterable<dynamic> parties;

  List<Candidate>? _candidates;
  List<QuestionGroup>? _questionGroups;

  Elections(this.name, this.description, this.location, this.parties, this._candidates,
      this._questionGroups)
      : id = name;

  Elections.fromFirestore(this.id, Map<String, dynamic> data)
      : name = data['Name'],
        description = data['Description'],
        location = data['Location'],
        parties = data['parties'];

  Map<String, Object?> toFirestore() =>
      {'Name': name, 'Description': description, 'Location': location, 'parties': parties};

  List<Candidate> getCandidates() {
    // TODO: loading from database.
    return _candidates ?? [];
  }

  Future<List<QuestionGroup>> getGroups(DataModel dataModel) async {
    if (_questionGroups != null) {
      return Future.value(_questionGroups);
    }
    return dataModel.loadGroups(this);
  }
}

class Party {
  String id;
  String name;
  String description;

  Party(this.name)
      : id = name,
        description = 'Description of party $name';

  Party.fromFirestore(this.id, Map<String, dynamic> data)
      : name = data['name'],
        description = data['description'] ?? '';

  Map<String, Object?> toFirestore() => {'name': name, 'description': description};
}

class Candidate {
  String firstName;
  String sureName;
  Party? party;

  Candidate(this.firstName, this.sureName, this.party);
}

class QuestionGroup {
  String id;

  String name;
  num? order;
  List<Question>? _questions;

  QuestionGroup(this.name, this._questions) : id = name;

  void orderQuestions() {
    if (_questions != null) {
      for (var i = 0; i < _questions!.length; i++) {
        _questions![i].order = 10 * (i + 1);
      }
    }
  }

  Future<List<Question>> getQuestions(DataModel dataModel, Elections elections) async {
    if (_questions != null) {
      return Future.value(_questions);
    }
    return dataModel.loadQuestions(elections, this);
  }

  QuestionGroup.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        name = snapshot.data()!['name'],
        order = snapshot.data()!['order'];

  Map<String, Object?> toFirestore() => {'order': order, 'name': name};
}

class Question {
  String id;
  num? order;
  String text;

  Question(this.text) : id = text.hashCode.toString();

  Question.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        order = snapshot.data()!['order'],
        text = snapshot.data()!['text'];

  Map<String, Object?> toFirestore() => {'order': order, 'text': text};
}

/// Representation of response from a candidate or a user to a question.
class QuestionResponse {
  double? response;
  double? weight;

  QuestionResponse(this.response);

  QuestionResponse.withWeight(this.response, this.weight);

  QuestionResponse.empty()
      : response = 0,
        weight = 1;

  QuestionResponse.fromFirestore(Map<String, dynamic> data)
      : response = data['response'],
        weight = data['weight'];

  Map<String, Object?> toFirestore() => {'response': response, 'weight': weight};
}
