import 'package:elections_match/models/fake_data_definition.dart';

import 'data.dart';

class FakeDataModel implements DataModel {

  final FakeDataDefinition data;

  FakeDataModel(this.data);

  @override
  Future<List<Elections>> getElections({String? tag}) async {
    return Future.value(data.fakeElections);
  }
}

class FakeElections implements Elections {
  @override
  String name;

  @override
  String description;

  @override
  String location;

  final List<FakeParty> parties;
  final List<FakeQuestionGroup> _questionGroups;


  FakeElections(this.name, this.description, this.location, this.parties,
      this._questionGroups);

  void orderGroups() {
    for (var i = 0; i < _questionGroups.length; i++) {
      _questionGroups[i].order = 10 * (i + 1);
    }
  }

  @override
  Future<List<Party>> getParties() async => Future.value(parties);

  @override
  Future<List<QuestionGroup>> getGroups() async => Future.value(_questionGroups);
}

class FakeParty implements Party {
  @override
  String name;

  @override
  String description;

  FakeParty(this.name)
      : description = 'Description of party $name';
}

class FakeQuestionGroup implements QuestionGroup {
  @override
  String name;

  @override
  num? order;

  final List<FakeQuestion> _questions;

  void orderQuestions() {
    for (var i = 0; i < _questions.length; i++) {
      _questions[i].order = 10 * (i + 1);
    }
  }

  FakeQuestionGroup(this.name, this._questions) ;

  @override
  Future<List<Question>> getQuestions() => Future.value(_questions);
}

class FakeQuestion implements Question {
  @override
  String text;

  @override
  num? order;

  FakeQuestion(this.text);
}

class FakeQuestionResponse implements QuestionResponse {
  @override
  double? response;

  @override
  double? weight;

  FakeQuestionResponse(this.response);

  FakeQuestionResponse.withWeight(this.response, this.weight);

  FakeQuestionResponse.empty()
      : response = 0,
        weight = 1;
}

class FakeUser implements User {
  @override
  String id;

  FakeUser(this.id);

  @override
  Future<FakeElectionResponses> getResponses(Elections elections) {
    // TODO: implement getResponses
    throw UnimplementedError();
  }
}

class FakeElectionResponses implements ElectionResponses {
  Map<String, QuestionResponse> responses = {};

  @override
  Map<String, QuestionResponse> getQuestionToResponses() => responses;
}
