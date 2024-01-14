import 'package:elections_match/models/data.dart';
import 'package:elections_match/screens/matching_results_screen.dart';
import 'package:elections_match/widgets/question_selector.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/material.dart';

class MatchingScreen extends StatefulWidget {
  final Elections elections;

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();

  const MatchingScreen(this.elections, {super.key});
}

class _MatchingScreenState extends State<MatchingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.elections.questionGroups.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor(context),
        title: Text('Matching candidates for ${widget.elections.name}'),
        bottom: buildTabBar(),
      ),
      body: buildQuestionGroups(context),
    );
  }

  TabBar buildTabBar() => TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: [for (final g in widget.elections.questionGroups) Tab(text: g.name)],
      );

  TabBarView buildQuestionGroups(BuildContext context) {
    int i = 1;
    final children = <Widget>[];
    for (final g in widget.elections.questionGroups) {
      children.add(buildGroupWidget(context, g, i++, widget.elections.questionGroups.length));
    }
    return TabBarView(controller: _tabController, children: children);
  }

  buildGroupWidget(BuildContext context, QuestionGroup group, int index, int numberOfGroups) {
    var questionWidgets = <Widget>[];
    int i = 1;
    for (final question in group.questions) {
      questionWidgets.add(QuestionSelector(question, i++));
    }

    final navigationRow = Row(children: [
      if (index > 1) ElevatedButton(onPressed: previousGroup, child: const Text('Previous')),
      const Spacer(),
      if (index < numberOfGroups) ElevatedButton(onPressed: nextGroup, child: const Text('Next')),
      if (index == numberOfGroups)
        ElevatedButton(onPressed: () => submitAnswers(context), child: const Text('Submit'))
    ]);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        children: <Widget>[AppBar(automaticallyImplyLeading: false, title: Text(group.name))] +
            questionWidgets +
            [navigationRow]);
  }

  void previousGroup() => _tabController.animateTo(_tabController.index -1);

  void nextGroup() => _tabController.animateTo(_tabController.index + 1);

  void submitAnswers(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MatchingResultsScreen(widget.elections)));
  }
}
