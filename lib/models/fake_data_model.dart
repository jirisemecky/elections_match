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

final QuestionGroup welfare = QuestionGroup(' Welfare state & family', _welfareQuestions);
final QuestionGroup health = QuestionGroup('Health', _healthQuestions);
final QuestionGroup education = QuestionGroup('Education', _educationQuestions);

final List<Question> _welfareQuestions = [
  Question('Do you support an increase in the retirement age (e.g., to 67)?'),
  Question('Should the federal government allocate more funding for health insurance premium subsidies'),
  Question('For married couples, the pension is currently limited to 150% of the maximum individual AHV pension (capping). Should this limit be eliminated?'),
  Question('For married couples, the pension is currently limited to 150% of the maximum individual AHV pension (capping). Should this limit be eliminated?'),
  Question('Should paid parental leave be increased beyond today''s 14 weeks of maternity leave and two weeks of paternity leave? [BePart question]'),
  Question('Should the federal government provide more financial support for public housing construction? [BePart question]'),
];

final List<Question> _healthQuestions = [
  Question('Should compulsory vaccination of children be introduced based on the Swiss vaccination plan?'),
  Question('Are you in favor of the introduction of a tax on foods containing sugar (sugar tax)?'),
  Question('Should insured persons contribute more to health care costs (e.g., increase the minimum deductible)?'),
  Question('Should the Federal Council''s ability to restrict private and economic life in the event of a pandemic be more limited?'),
  Question('Should the federal government be given the authority to determine the hospital offering (national hospital planning with regard to locations and range of services)?'),
];

final List<Question> _educationQuestions = [
  Question('According to the Swiss integrated schooling concept, children with learning difficulties or disabilities should be taught in regular classes. Do you approve of this concept?'),
  Question('Should the federal government raise the requirements for the gymnasiale matura?'),
  Question('Should the state be more committed to equal educational opportunities (e.g., through subsidized remedial courses for students from low-income families)?'),
];


final List<Elections> ELECTIONS = [
  Elections('Hawaii', 'Elections for parliament in Hawai in Spring 2024', _hawaiiParties, [welfare, health, education]),
  Elections('Prague', 'Presidential elections in Czech', _czechParties, [welfare, health, education]),
  Elections('New York', 'Voting of local policemen', [Party('Good cop'), Party('Bad cop')], [welfare, health, education]),
];

