import 'dart:core';

/// Model providing interface for fetching data.
abstract class DataModel {
  Future<List<Elections>> loadElections({String? tag});
}

abstract class Elections {
  String get name;
  String get description;
  String get location;

  Future<List<Party>> getParties();
  Future<List<QuestionGroup>> getGroups();
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

/// Representation of response from a candidate or a user to a question.
abstract class QuestionResponse {
  double? get response;
  double? get weight;

  set response(double? value);
  set weight(double? value);
}
