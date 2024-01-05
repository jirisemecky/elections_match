import 'package:elections_match/models/data.dart';
import 'package:elections_match/screens/matching_results_screen.dart';
import 'package:elections_match/widgets/question_selector.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/material.dart';

class MatchingScreen extends StatelessWidget {
  final Elections elections;

  const MatchingScreen(this.elections, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: elections.questionGroups.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBarBackgroundColor(context),
            title: Text('Matching candidates for ${elections.name}'),
            bottom: buildTabBar(),
          ),
          body: buildQuestionGroups(context),
        ));
  }

  TabBar buildTabBar() => TabBar(
        isScrollable: true,
        tabs: [for (final g in elections.questionGroups) Tab(text: g.name)],
      );

  Widget buildQuestionGroups(BuildContext context) {
    int i = 1;
    final children = <Widget>[];
    for (final g in elections.questionGroups) {
      children.add(buildGroupWidget(context, g, i++, elections.questionGroups.length));
    }
    return TabBarView(children: children);
  }

  buildGroupWidget(BuildContext context, QuestionGroup group, int index, int numberOfGroups) {
    var questionWidgets = <Widget>[];
    int i = 1;
    for (final question in group.questions) {
      questionWidgets.add(QuestionSelector(question, i++));
    }

    final navigationRow = Row(children: [
      if (index > 1)
        ElevatedButton(onPressed: previousGroup, child: const Text('Previous')),
      const Spacer(),
      if (index < numberOfGroups)
        ElevatedButton(onPressed: nextGroup, child: const Text('Next')),
      if (index == numberOfGroups)
        ElevatedButton(onPressed: () => submitAnswers(context), child: const Text('Submit'))
    ]);

    return Column(
        children: <Widget>[
              AppBar(automaticallyImplyLeading: false, title: Text(group.name))
            ] +
            questionWidgets +
            [navigationRow]);
  }

  void previousGroup() {}
  void nextGroup() {}

  void submitAnswers(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(builder: (context) => MatchingResultsScreen(elections)));
  }
}
