import 'dart:core';

import 'package:elections_match/models/fake_data_model.dart';

/// Model providing interface for fetching data.
abstract class DataModel {
  Future<List<Elections>> loadElections({String? tag});

  Future<List<Party>> loadParties(Elections elections);
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
        parties = data['parties'],
        _questionGroups = FakeDataModel.hawaiiGroups;

  Map<String, Object?> toFirestore() =>
      {'Name': name, 'Description': description, 'Location': location, 'parties': parties};

  List<Candidate> getCandidates() {
    // TODO: loading from database.
    return _candidates ?? [];
  }

  List<QuestionGroup> getGroups() {
    // TODO: loading from database.
    return _questionGroups ?? [];
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
  String name;
  List<Question> questions;

  QuestionGroup(this.name, this.questions);

  QuestionGroup.fromFirestore(Map<String, dynamic> data)
      : name = data['name'],
        questions = data['questions'];

  Map<String, Object?> toFirestore() => {'name': name, 'questions': questions};
}

class Question {
  String id;
  String text;

  Question(this.text) : id = text.hashCode.toString();

  Question.fromFirestore(this.id, Map<String, dynamic> data) : text = data['text'];

  Map<String, Object?> toFirestore() => {'text': text};
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
