import 'dart:core';

class Elections {
  String name;
  String description;
  List<Party> parties;
  List<Candidate> candidates;
  List<QuestionGroup> questionGroups;

  Elections(this.name, this.description, this.parties, this.candidates, this.questionGroups);

  String get id => name;

  num get numberOfQuestions =>
      questionGroups.map((g) => g.questions.length).reduce((value, element) => value + element);
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
  QuestionResponse.empty() : response = 0, weight = 1;

}
