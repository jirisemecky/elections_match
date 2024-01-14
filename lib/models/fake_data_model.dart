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
final QuestionGroup immigrationAndIntegration =
    QuestionGroup('Immigration and Integration', _immigrationAndIntegrationQuestions);
final QuestionGroup societyAndEthics =
    QuestionGroup('Society and Ethics', _societyAndEthicsQuestions);
final QuestionGroup financesAndTaxes =
    QuestionGroup('Finances and Taxes', _financesAndTaxesQuestions);
final QuestionGroup economyAndLabour =
    QuestionGroup('Economy and Labour', _economyAndLabourQuestions);
final QuestionGroup energyAndTransport =
    QuestionGroup('Energy and Transport', _energyAndTransportQuestions);
final QuestionGroup natureAndConservation =
    QuestionGroup('Mature and Conservation', _natureAndConservationQuestions);
final QuestionGroup democracyMediaAndDigitization =
    QuestionGroup('Democracy, Media and Digitization', _democracyMediaAndDigitizationQuestions);

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

final List<Question> _immigrationAndIntegrationQuestions = [
  Question(
      'Should the conditions for naturalization be relaxed (e.g., shorter ￼residence period)?'),
  Question(
      'Should more qualified workers from non-EU/EFTA countries be allowed to work in Switzerland (increase ￼third-country quota)?'),
  Question(
      'Do you support efforts to house asylum seekers in centers outside Europe during the asylum procedure?'),
  Question(
      'Should foreign nationals who have lived in Switzerland for at least ten years be granted the right to vote and stand for election at the municipal level?'),
];

final List<Question> _societyAndEthicsQuestions = [
  Question('Should cannabis use be legalized?'),
  Question(
      'Would you be in favour of doctors being allowed to administer direct active euthanasia in Switzerland?'),
  Question('Should a third official gender be introduced alongside "female" and "male"?'),
  Question('Do you think it'
      's right for same-sex couples to have the same rights as heterosexual couples in all areas?'),
];

final List<Question> _financesAndTaxesQuestions = [
  Question('Do you support tax cuts at the federal level over the next four years?'),
  Question('Should married couples be taxed separately (individual taxation)?'),
  Question(
      'Would you support the introduction of a national inheritance tax on all inheritances over one million Swiss francs?'),
  Question(
      'Should the differences between cantons with high and low financial capacity be further reduced through ￼fiscal equalization?'),
];

final List<Question> _economyAndLabourQuestions = [
  Question(
      'Are you in favor of introducing a ￼minimum wage of CHF 4,000 for all full-time employees?'),
  Question(
      'Do you support stricter regulations for the financial sector (e.g., stricter ￼capital requirements for banks, ban on bonuses)?'),
  Question(
      'Should private households be free to choose their electricity supplier (complete ￼liberalization of the electricity market)?'),
  Question(
      'Should housing construction regulations be relaxed (e.g., noise protection, ￼occupancy rates)?'),
  Question('Are you in favor of stricter controls on equal pay for women and men?'),
];

final List<Question> _energyAndTransportQuestions = [
  Question('Should busy sections of highways be widened?'),
  Question(
      'Should Switzerland ban the registration of new passenger cars with ￼internal combustion engines starting in 2035?'),
  Question(
      'To achieve climate targets, should incentives and target agreements be relied on exclusively, rather than bans and restrictions?'),
  Question('Do you think it'
      's fair that environmental and landscape protection rules are being relaxed to allow for the development of ￼renewable energy?'),
  Question('Should the construction of new nuclear power plants in Switzerland be allowed again?'),
  Question(
      'Should the state guarantee a comprehensive ￼public service offering also in rural regions?'),
  Question(
      'Would you be in favor of the introduction of increasing electricity tariffs when consumption is higher (￼progressive electricity tariffs)?'),
];

final List<Question> _natureAndConservationQuestions = [
  Question(
      'Are you in favor of further relaxing the protection regulations for large predators (lynx, wolf, bear)?'),
  Question(
      'Should direct payments only be granted to farmers with proof of ecological performance?'),
  Question(
      'Are you in favour of stricter animal welfare regulations for livestock (e.g. permanent access to outdoor areas)?'),
  Question('Should 30% of Switzerland' 's land area be dedicated to preserving biodiversity?'),
  Question('Would you support a ban on single-use plastic and non-recyclable plastics?'),
  Question(
      'Are you in favour of government measures to make the use of electronic devices more sustainable (e.g., right to repair, extension of warranty period, minimum guaranteed period for software updates)?'),
];

final List<Question> _democracyMediaAndDigitizationQuestions = [
  Question(
      'Should the Swiss mobile network be equipped throughout the country with the latest technology (currently 5G standard)?'),
  Question(
      'Should the federal government be given additional powers in the area of digitization of government services in order to be able to impose binding directives and standards on the cantons?'),
  Question(
      'Are you in favor of stronger regulation of the major Internet platforms (i.e., transparency rules on algorithms, increased liability for content, combating disinformation)?'),
  Question(
      'A popular initiative aims to reduce television and radio fees (CHF 200 per household, exemption for businesses). Do you support this initiative?'),
  Question('Are you in favour of lowering the voting age to 16?'),
  Question(
      'Should it be possible to hold a referendum on federal spending above a certain amount (optional financial referendum)?'),
];

final List<Elections> fakeElections = [
  Elections('Hawaii', 'Elections for parliament in Hawaii in Spring 2024', _hawaiiParties,
      _hawaiiCandidates, [
    welfare,
    health,
    education,
    immigrationAndIntegration,
    societyAndEthics,
    financesAndTaxes,
    economyAndLabour,
    energyAndTransport,
    natureAndConservation,
    democracyMediaAndDigitization
  ]),
  Elections('Prague', 'Presidential elections in Czech', _czechParties, _czechCandidates,
      [welfare, health, education, immigrationAndIntegration]),
  Elections('New York', 'Voting of local policemen', _nyParties, _nyCandidates,
      [welfare, health, education]),
];
