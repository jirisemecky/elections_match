

import 'dart:core';


class Elections {
  String name;
  String description;
  List<Party> parties;
  List<QuestionGroup> questionGroups;

  Elections(this.name, this.description, this.parties, this.questionGroups);
}


class Party {
  String name;
  Party(this.name);
}

class Candidate {
  String firstName;
  String sureName;

  Candidate(this.firstName, this.sureName);
}

enum QuestionType {
  AGREEMENT,
}

class QuestionGroup {
  String name;
  List<Question> questions;

  QuestionGroup(this.name, this.questions);
}

class Question {
  String text;
  QuestionType type;

  Question(this.text) : type = QuestionType.AGREEMENT;

}