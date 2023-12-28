

import 'dart:core';
import 'dart:core';


class Elections {
  String name;
  String description;
  List<Party> parties;
  List<Question> questions;

  Elections(this.name, this.description, this.parties, this.questions);
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

class Question {
  String text;
  QuestionType type;

  Question(this.text) : type = QuestionType.AGREEMENT;

}