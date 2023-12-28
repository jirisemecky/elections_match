import 'data.dart';

final List<Party> _hawaiiParties = [
  Party('The leftmost party'),
  Party('Beachboys'),
  Party('Bikini for the World'),
  Party('Surfers to the islands'),
];

final List<Party> _czechParties = [
  Party('ODS'),
  Party('Starostove a nezavisli'),
  Party('Pirati'),
  Party('ANO'),
  Party('Komousi'),
  Party('KDU/CSL'),
  Party('Socani'),
];

final List<Question> _defaultQuestions = [
  Question('Q1'),
  Question('Q2'),
  Question('Q3'),
  Question('Q4'),
  Question('Q5'),
  Question('Q6'),
];

final List<Elections> ELECTIONS = [
  Elections('Hawaii', 'Elections for parliament in Hawai in Spring 2024', _hawaiiParties, _defaultQuestions),
  Elections('Prague', 'Presidential elections in Czech', _czechParties, _defaultQuestions),
  Elections('New York', 'Voting of local policemen', [Party('Good cop'), Party('Bad cop')], _defaultQuestions),
];

