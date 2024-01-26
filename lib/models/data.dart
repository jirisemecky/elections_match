import 'dart:core';

/// Model providing interface for fetching data.
abstract class DataModel {
  Future<List<Elections>> loadElections({String? tag});
}

class Elections {
  final String id;

  final String name;
  final String description;
  final String location;

  List<Party>? _parties;
  List<Candidate>? _candidates;
  List<QuestionGroup>? _questionGroups;

  Elections(this.name, this.description, this.location, this._parties, this._candidates,
      this._questionGroups)
      : id = name;

  Elections.fromFirebase(this.id, Map<String, dynamic> data)
      : name = data['Name'],
        description = data['Description'],
        location = data['Location'];

  List<Party> getParties() {
    // TODO: loading from database.
    return _parties ?? [];
  }
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
  String name;

  Party(this.name);
}

class Candidate {
  String firstName;
  String sureName;
  Party? party;

  Candidate(this.firstName, this.sureName, this.party);
}

enum QuestionType {
  agreement,
}

class QuestionGroup {
  String name;
  List<Question> questions;

  QuestionGroup(this.name, this.questions);
}

class Question {
  String id;
  String text;
  QuestionType type;

  Question(this.text)
      : type = QuestionType.agreement,
        id = text.hashCode.toString();
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

}
