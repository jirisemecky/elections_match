import 'dart:core';

/// Model providing interface for fetching data.
abstract class DataModel {
  Future<List<Elections>> getElections({String? tag});
}

abstract class Elections {
  String get name;
  String get description;
  String get location;

  Future<List<Party>> getParties();
  Future<List<QuestionGroup>> getGroups();
  Future<List<Candidate>> getCandidates();
}

abstract class Party {
  String get name;
  String get description;
}


abstract class QuestionGroup {
  String get name;
  num? get order;
  Future<List<Question>> getQuestions();
}

abstract class Question {
  num? get order;
  String get text;
}

/// Data for a single logged in user.
abstract class User {
  String get id;
  Future<ElectionResponses> getResponses(Elections elections);
}

/// Representation of responses to all questions in the elections.
abstract class ElectionResponses {
  Map<String, QuestionResponse> getQuestionToResponses();
}

/// Representation of response from a candidate or a user to a question.
abstract class QuestionResponse {
  double? get response;
  double? get weight;

  set response(double? value);
  set weight(double? value);
}

abstract class Candidate {
  Party get party;
  String get firstName;
  String get lastName;
}
