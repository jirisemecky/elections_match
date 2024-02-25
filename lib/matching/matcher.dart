import '../models/data.dart';

class CandidateWithMatchingScore {
  String politician;
  double score;

  CandidateWithMatchingScore(this.politician, this.score);
}

class PartyWithMatchingScore {
  Party party;
  double score;

  PartyWithMatchingScore(this.party, this.score);
}
/// Represents abstract matcher algorithm.
abstract class Matcher {
  List<CandidateWithMatchingScore> computeCandidateMatches(ElectionResponses responses);
  Future<List<PartyWithMatchingScore>> computePartyMatches(ElectionResponses responses);
}
