import 'package:elections_match/models/data.dart';

/// Local user storage before pemanency is solved.
final UserStorage _userStorage = UserStorage();

UserStorage getUserStorage() => _userStorage;

/// Wrapper data class for all information about a single end user.
///
/// This only contains private information, not publicly sharable and specific to answers of a
/// given user.
class UserStorage {
  /// Mapping from election names to filled results.
  Map<String, QuestionResults> filledElections = {};

  QuestionResults getElections(Elections elections) =>
      filledElections.putIfAbsent(elections.id, () => QuestionResults(elections));
}

class QuestionResults {
  Elections elections;

  Map<String, QuestionResponse> responses = {};

  QuestionResults(this.elections);

  QuestionResponse getQuestion(Question question) =>
      responses.putIfAbsent(question.id, () => QuestionResponse.empty());

  bool get isSomethingAnswered => responses.isNotEmpty;
}
