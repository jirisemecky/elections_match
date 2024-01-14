import 'data.dart';

final List<Party> _hawaiiParties = [
  Party('The leftmost party'),
  Party('Beachboys'),
  Party('Bikini for the World'),
  Party('Surfers to the islands'),
];

final List<Candidate> _hawaiiCandidates = [
  Candidate('Amoura', 'Lopez', _hawaiiParties[0]),
  Candidate('Michael', 'Murray', _hawaiiParties[0]),
  Candidate('Faith', 'Alfaro', _hawaiiParties[0]),
  Candidate('Xzavier', 'Garrison', _hawaiiParties[0]),
  Candidate('Cadence', 'Wong', _hawaiiParties[1]),
  Candidate('Walter', 'Santos', _hawaiiParties[1]),
  Candidate('Alana', 'Newman', _hawaiiParties[1]),
  Candidate('Anderson', 'Portillo', _hawaiiParties[2]),
  Candidate('Nathalie', 'Andrade', _hawaiiParties[2]),
  Candidate('Abdiel', 'Freeman', _hawaiiParties[2]),
  Candidate('Norah', 'Arellano', _hawaiiParties[2]),
  Candidate('Kellan', 'Peck', _hawaiiParties[2]),
  Candidate('Crystal', 'Kent', _hawaiiParties[3]),
  Candidate('Mekhi', 'Tran', _hawaiiParties[3]),
  Candidate('Kylie', 'Little', _hawaiiParties[3]),
  Candidate('Lennox', 'Warner', _hawaiiParties[3]),
];

final List<Party> _czechParties = [
  Party('ODS'),
  Party('Starostové a nezávislí'),
  Party('Piráti'),
  Party('ANO'),
  Party('Komouši'),
  Party('KDU/CSL'),
  Party('Socani'),
];

final List<Candidate> _czechCandidates = [
  Candidate('Jozef', 'Kliment', _czechParties[0]),
  Candidate('Petra', 'Cibulková', _czechParties[0]),
  Candidate('Božena', 'Šišková', _czechParties[0]),
  Candidate('Romana', 'Bečvářová', _czechParties[0]),
  Candidate('Emil', 'Šafář', _czechParties[1]),
  Candidate('Jindřiška', 'Vojáčková', _czechParties[1]),
  Candidate('Nikola', 'Čiháková', _czechParties[1]),
  Candidate('Iveta', 'Řeháčková', _czechParties[2]),
  Candidate('Viktor', 'Gabriel', _czechParties[2]),
  Candidate('Vojtěch', 'Suchánek', _czechParties[3]),
  Candidate('Adam', 'Bartošek', _czechParties[3]),
  Candidate('Marie', 'Kurková', _czechParties[3]),
  Candidate('Miluše', 'Čápová', _czechParties[3]),
  Candidate('Simona', 'Zemanová', _czechParties[3]),
  Candidate('Zdenka', 'Holubová', _czechParties[3]),
  Candidate('Renata', 'Veselá', _czechParties[4]),
  Candidate('Libor', 'Medek', _czechParties[4]),
  Candidate('Andrea', 'Smutná', _czechParties[5]),
  Candidate('Marie', 'Janatová', _czechParties[6]),
  Candidate('Dominika', 'Semerádová', _czechParties[6]),
];

final List<Party> _nyParties = [Party('Good cop'), Party('Bad cop')];

final List<Candidate> _nyCandidates = [
  Candidate('Camilla', 'Thomas', _nyParties[0]),
  Candidate('Brynlee', 'Hughes', _nyParties[0]),
  Candidate('Michael', 'Hamilton', _nyParties[0]),
  Candidate('Elena', 'Porter', _nyParties[0]),
  Candidate('Weston', 'Hale', _nyParties[0]),
  Candidate('Emmett', 'Butler', _nyParties[0]),
  Candidate('Hudson', 'Hammond', _nyParties[0]),
  Candidate('Anaya', 'Fuller', _nyParties[0]),
  Candidate('Remington', 'Berry', _nyParties[0]),
  Candidate('Daleyza', 'Price', _nyParties[0])
];

final QuestionGroup welfare = QuestionGroup(' Welfare state & family', _welfareQuestions);
final QuestionGroup health = QuestionGroup('Health', _healthQuestions);
final QuestionGroup education = QuestionGroup('Education', _educationQuestions);

final List<Question> _welfareQuestions = [
  Question('Do you support an increase in the retirement age (e.g., to 67)?'),
  Question(
      'Should the federal government allocate more funding for health insurance premium subsidies'),
  Question(
      'For married couples, the pension is currently limited to 150% of the maximum individual AHV pension (capping). Should this limit be eliminated?'),
  Question(
      'For married couples, the pension is currently limited to 150% of the maximum individual AHV pension (capping). Should this limit be eliminated?'),
  Question('Should paid parental leave be increased beyond today'
      's 14 weeks of maternity leave and two weeks of paternity leave? [BePart question]'),
  Question(
      'Should the federal government provide more financial support for public housing construction? [BePart question]'),
];

final List<Question> _healthQuestions = [
  Question(
      'Should compulsory vaccination of children be introduced based on the Swiss vaccination plan?'),
  Question('Are you in favor of the introduction of a tax on foods containing sugar (sugar tax)?'),
  Question(
      'Should insured persons contribute more to health care costs (e.g., increase the minimum deductible)?'),
  Question('Should the Federal Council'
      's ability to restrict private and economic life in the event of a pandemic be more limited?'),
  Question(
      'Should the federal government be given the authority to determine the hospital offering (national hospital planning with regard to locations and range of services)?'),
];

final List<Question> _educationQuestions = [
  Question(
      'According to the Swiss integrated schooling concept, children with learning difficulties or disabilities should be taught in regular classes. Do you approve of this concept?'),
  Question('Should the federal government raise the requirements for the gymnasiale matura?'),
  Question(
      'Should the state be more committed to equal educational opportunities (e.g., through subsidized remedial courses for students from low-income families)?'),
];

final List<Elections> fakeElections = [
  Elections('Hawaii', 'Elections for parliament in Hawaii in Spring 2024', _hawaiiParties,
      _hawaiiCandidates, [welfare, health, education]),
  Elections('Prague', 'Presidential elections in Czech', _czechParties, _czechCandidates,
      [welfare, health, education]),
  Elections('New York', 'Voting of local policemen', _nyParties, _nyCandidates,
      [welfare, health, education]),
];
