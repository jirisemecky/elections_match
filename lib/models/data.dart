

import 'dart:core';


class Elections {
  String name;
  String description;
  List<Party> parties;
  List<Candidate> candidates;
  List<QuestionGroup> questionGroups;

  Elections(this.name, this.description, this.parties, this.candidates, this.questionGroups);
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
  String text;
  QuestionType type;

  Question(this.text) : type = QuestionType.agreement;

}
