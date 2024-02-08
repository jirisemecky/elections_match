import 'fake_data_model.dart';

final class FakeDataDefinition {
  static final List<FakeParty> _hawaiiParties = [
    FakeParty('The leftmost party'),
    FakeParty('Beachboys'),
    FakeParty('Bikini for the World'),
    FakeParty('Surfers to the islands'),
  ];

  // static final List<Candidate> _hawaiiCandidates = [
  //   Candidate('Amoura', 'Lopez', _hawaiiParties[0]),
  //   Candidate('Michael', 'Murray', _hawaiiParties[0]),
  //   Candidate('Faith', 'Alfaro', _hawaiiParties[0]),
  //   Candidate('Xzavier', 'Garrison', _hawaiiParties[0]),
  //   Candidate('Cadence', 'Wong', _hawaiiParties[1]),
  //   Candidate('Walter', 'Santos', _hawaiiParties[1]),
  //   Candidate('Alana', 'Newman', _hawaiiParties[1]),
  //   Candidate('Anderson', 'Portillo', _hawaiiParties[2]),
  //   Candidate('Nathalie', 'Andrade', _hawaiiParties[2]),
  //   Candidate('Abdiel', 'Freeman', _hawaiiParties[2]),
  //   Candidate('Norah', 'Arellano', _hawaiiParties[2]),
  //   Candidate('Kellan', 'Peck', _hawaiiParties[2]),
  //   Candidate('Crystal', 'Kent', _hawaiiParties[3]),
  //   Candidate('Mekhi', 'Tran', _hawaiiParties[3]),
  //   Candidate('Kylie', 'Little', _hawaiiParties[3]),
  //   Candidate('Lennox', 'Warner', _hawaiiParties[3]),
  // ];

  static final List<FakeParty> _czechParties = [
    FakeParty('ODS'),
    FakeParty('Starostové a nezávislí'),
    FakeParty('Piráti'),
    FakeParty('ANO'),
    FakeParty('Komouši'),
    FakeParty('KDU/CSL'),
    FakeParty('Socani'),
  ];

  // static final List<Candidate> _czechCandidates = [
  //   Candidate('Jozef', 'Kliment', _czechParties[0]),
  //   Candidate('Petra', 'Cibulková', _czechParties[0]),
  //   Candidate('Božena', 'Šišková', _czechParties[0]),
  //   Candidate('Romana', 'Bečvářová', _czechParties[0]),
  //   Candidate('Emil', 'Šafář', _czechParties[1]),
  //   Candidate('Jindřiška', 'Vojáčková', _czechParties[1]),
  //   Candidate('Nikola', 'Čiháková', _czechParties[1]),
  //   Candidate('Iveta', 'Řeháčková', _czechParties[2]),
  //   Candidate('Viktor', 'Gabriel', _czechParties[2]),
  //   Candidate('Vojtěch', 'Suchánek', _czechParties[3]),
  //   Candidate('Adam', 'Bartošek', _czechParties[3]),
  //   Candidate('Marie', 'Kurková', _czechParties[3]),
  //   Candidate('Miluše', 'Čápová', _czechParties[3]),
  //   Candidate('Simona', 'Zemanová', _czechParties[3]),
  //   Candidate('Zdenka', 'Holubová', _czechParties[3]),
  //   Candidate('Renata', 'Veselá', _czechParties[4]),
  //   Candidate('Libor', 'Medek', _czechParties[4]),
  //   Candidate('Andrea', 'Smutná', _czechParties[5]),
  //   Candidate('Marie', 'Janatová', _czechParties[6]),
  //   Candidate('Dominika', 'Semerádová', _czechParties[6]),
  // ];

  static final List<FakeParty> _nyParties = [FakeParty('Good cop'), FakeParty('Bad cop')];

  // static final List<Candidate> _nyCandidates = [
  //   Candidate('Camilla', 'Thomas', _nyParties[0]),
  //   Candidate('Brynlee', 'Hughes', _nyParties[0]),
  //   Candidate('Michael', 'Hamilton', _nyParties[0]),
  //   Candidate('Elena', 'Porter', _nyParties[0]),
  //   Candidate('Weston', 'Hale', _nyParties[0]),
  //   Candidate('Emmett', 'Butler', _nyParties[0]),
  //   Candidate('Hudson', 'Hammond', _nyParties[0]),
  //   Candidate('Anaya', 'Fuller', _nyParties[0]),
  //   Candidate('Remington', 'Berry', _nyParties[0]),
  //   Candidate('Daleyza', 'Price', _nyParties[0])
  // ];

  static final FakeQuestionGroup welfare = FakeQuestionGroup(' Welfare state & family', _welfareQuestions);
  static final FakeQuestionGroup health = FakeQuestionGroup('Health', _healthQuestions);
  static final FakeQuestionGroup education = FakeQuestionGroup('Education', _educationQuestions);
  static final FakeQuestionGroup immigrationAndIntegration =
  FakeQuestionGroup('Immigration and Integration', _immigrationAndIntegrationQuestions);
  static final FakeQuestionGroup societyAndEthics =
  FakeQuestionGroup('Society and Ethics', _societyAndEthicsQuestions);
  static final FakeQuestionGroup financesAndTaxes =
  FakeQuestionGroup('Finances and Taxes', _financesAndTaxesQuestions);
  static final FakeQuestionGroup economyAndLabour =
  FakeQuestionGroup('Economy and Labour', _economyAndLabourQuestions);
  static final FakeQuestionGroup energyAndTransport =
  FakeQuestionGroup('Energy and Transport', _energyAndTransportQuestions);
  static final FakeQuestionGroup natureAndConservation =
  FakeQuestionGroup('Mature and Conservation', _natureAndConservationQuestions);
  static final FakeQuestionGroup democracyMediaAndDigitization =
  FakeQuestionGroup('Democracy, Media and Digitization', _democracyMediaAndDigitizationQuestions);

  static final List<FakeQuestion> _welfareQuestions = [
    FakeQuestion('Do you support an increase in the retirement age (e.g., to 67)?'),
    FakeQuestion(
        'Should the federal government allocate more funding for health insurance premium subsidies'),
    FakeQuestion(
        'For married couples, the pension is currently limited to 150% of the maximum individual AHV pension (capping). Should this limit be eliminated?'),
    FakeQuestion('Should paid parental leave be increased beyond today'
        's 14 weeks of maternity leave and two weeks of paternity leave?'),
    FakeQuestion(
        'Should the federal government provide more financial support for public housing construction?'),
  ];

  static final List<FakeQuestion> _healthQuestions = [
    FakeQuestion(
        'Should compulsory vaccination of children be introduced based on the Swiss vaccination plan?'),
    FakeQuestion(
        'Are you in favor of the introduction of a tax on foods containing sugar (sugar tax)?'),
    FakeQuestion(
        'Should insured persons contribute more to health care costs (e.g., increase the minimum deductible)?'),
    FakeQuestion('Should the Federal Council'
        's ability to restrict private and economic life in the event of a pandemic be more limited?'),
    FakeQuestion(
        'Should the federal government be given the authority to determine the hospital offering (national hospital planning with regard to locations and range of services)?'),
  ];

  static final List<FakeQuestion> _educationQuestions = [
    FakeQuestion(
        'According to the Swiss integrated schooling concept, children with learning difficulties or disabilities should be taught in regular classes. Do you approve of this concept?'),
    FakeQuestion('Should the federal government raise the requirements for the gymnasiale matura?'),
    FakeQuestion(
        'Should the state be more committed to equal educational opportunities (e.g., through subsidized remedial courses for students from low-income families)?'),
  ];

  static final List<FakeQuestion> _immigrationAndIntegrationQuestions = [
    FakeQuestion(
        'Should the conditions for naturalization be relaxed (e.g., shorter residence period)?'),
    FakeQuestion(
        'Should more qualified workers from non-EU/EFTA countries be allowed to work in Switzerland (increase third-country quota)?'),
    FakeQuestion(
        'Do you support efforts to house asylum seekers in centers outside Europe during the asylum procedure?'),
    FakeQuestion(
        'Should foreign nationals who have lived in Switzerland for at least ten years be granted the right to vote and stand for election at the municipal level?'),
  ];

  static final List<FakeQuestion> _societyAndEthicsQuestions = [
    FakeQuestion('Should cannabis use be legalized?'),
    FakeQuestion(
        'Would you be in favour of doctors being allowed to administer direct active euthanasia in Switzerland?'),
    FakeQuestion('Should a third official gender be introduced alongside "female" and "male"?'),
    FakeQuestion('Do you think it'
        's right for same-sex couples to have the same rights as heterosexual couples in all areas?'),
  ];

  static final List<FakeQuestion> _financesAndTaxesQuestions = [
    FakeQuestion('Do you support tax cuts at the federal level over the next four years?'),
    FakeQuestion('Should married couples be taxed separately (individual taxation)?'),
    FakeQuestion(
        'Would you support the introduction of a national inheritance tax on all inheritances over one million Swiss francs?'),
    FakeQuestion(
        'Should the differences between cantons with high and low financial capacity be further reduced through ￼fiscal equalization?'),
  ];

  static final List<FakeQuestion> _economyAndLabourQuestions = [
    FakeQuestion(
        'Are you in favor of introducing a minimum wage of CHF 4,000 for all full-time employees?'),
    FakeQuestion(
        'Do you support stricter regulations for the financial sector (e.g., stricter capital requirements for banks, ban on bonuses)?'),
    FakeQuestion(
        'Should private households be free to choose their electricity supplier (complete liberalization of the electricity market)?'),
    FakeQuestion(
        'Should housing construction regulations be relaxed (e.g., noise protection, occupancy rates)?'),
    FakeQuestion('Are you in favor of stricter controls on equal pay for women and men?'),
  ];

  static final List<FakeQuestion> _energyAndTransportQuestions = [
    FakeQuestion('Should busy sections of highways be widened?'),
    FakeQuestion(
        'Should Switzerland ban the registration of new passenger cars with internal combustion engines starting in 2035?'),
    FakeQuestion(
        'To achieve climate targets, should incentives and target agreements be relied on exclusively, rather than bans and restrictions?'),
    FakeQuestion('Do you think it'
        's fair that environmental and landscape protection rules are being relaxed to allow for the development of renewable energy?'),
    FakeQuestion(
        'Should the construction of new nuclear power plants in Switzerland be allowed again?'),
    FakeQuestion(
        'Should the state guarantee a comprehensive public service offering also in rural regions?'),
    FakeQuestion(
        'Would you be in favor of the introduction of increasing electricity tariffs when consumption is higher (progressive electricity tariffs)?'),
  ];

  static final List<FakeQuestion> _natureAndConservationQuestions = [
    FakeQuestion(
        'Are you in favor of further relaxing the protection regulations for large predators (lynx, wolf, bear)?'),
    FakeQuestion(
        'Should direct payments only be granted to farmers with proof of ecological performance?'),
    FakeQuestion(
        'Are you in favour of stricter animal welfare regulations for livestock (e.g. permanent access to outdoor areas)?'),
    FakeQuestion('Should 30% of Switzerland' 's land area be dedicated to preserving biodiversity?'),
    FakeQuestion('Would you support a ban on single-use plastic and non-recyclable plastics?'),
    FakeQuestion(
        'Are you in favour of government measures to make the use of electronic devices more sustainable (e.g., right to repair, extension of warranty period, minimum guaranteed period for software updates)?'),
  ];

  static final List<FakeQuestion> _democracyMediaAndDigitizationQuestions = [
    FakeQuestion(
        'Should the Swiss mobile network be equipped throughout the country with the latest technology (currently 5G standard)?'),
    FakeQuestion(
        'Should the federal government be given additional powers in the area of digitization of government services in order to be able to impose binding directives and standards on the cantons?'),
    FakeQuestion(
        'Are you in favor of stronger regulation of the major Internet platforms (i.e., transparency rules on algorithms, increased liability for content, combating disinformation)?'),
    FakeQuestion(
        'A popular initiative aims to reduce television and radio fees (CHF 200 per household, exemption for businesses). Do you support this initiative?'),
    FakeQuestion('Are you in favour of lowering the voting age to 16?'),
    FakeQuestion(
        'Should it be possible to hold a referendum on federal spending above a certain amount (optional financial referendum)?'),
  ];

  static final hawaiiGroups = [
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
  ];

  final List<FakeElections> fakeElections = [
    FakeElections('Hawaii', 'FakeElections for parliament in Hawaii in Spring 2024', 'Hawaii',
        _hawaiiParties, hawaiiGroups),
    FakeElections(
        'Prague',
        'Presidential elections in Czech',
        'Czechia',
        _czechParties,
        [welfare, health, education, immigrationAndIntegration]),
    FakeElections('New York', 'Voting of local policemen', 'NY', _nyParties,
        [welfare, health, education]),
  ];

  final FakeUser fakeTestUsers = FakeUser('test-1');
}
