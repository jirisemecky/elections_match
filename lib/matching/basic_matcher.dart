import '../models/data.dart';
import 'matcher.dart';

/// Simple implementation of matcher.
class BasicMatcher implements Matcher {
  Elections elections;

  BasicMatcher(this.elections);

  @override
  List<CandidateWithMatchingScore> computeCandidateMatches(ElectionResponses responses) {
    // TODO(jirka): replace fake.
    return [
      CandidateWithMatchingScore('Josef', 1.0),
      CandidateWithMatchingScore('Adam', 0.5),
      CandidateWithMatchingScore('Andrej', -1.2)
    ];
  }

  @override
  Future<List<PartyWithMatchingScore>> computePartyMatches(ElectionResponses responses) async {
    var parties = await elections.getParties();
    return parties.map((p) => PartyWithMatchingScore(p, 0.7)).toList();
  }
}
