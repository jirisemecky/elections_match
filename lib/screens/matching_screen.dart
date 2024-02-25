import 'package:elections_match/models/data.dart';
import 'package:elections_match/screens/results_screen.dart';
import 'package:elections_match/widgets/question_group_widget.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/material.dart';

class MatchingScreen extends StatefulWidget {
  final DataModel dataModel;
  final Elections elections;
  final List<QuestionGroup> groups;

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();

  const MatchingScreen(this.dataModel, this.elections, this.groups, {super.key});
}

class _MatchingScreenState extends State<MatchingScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.groups.length, vsync: this);
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
      bottomSheet: buildNavigationRow(),
    );
  }

  TabBar buildTabBar() => TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: [for (final g in widget.groups) Tab(text: g.name)],
      );

  TabBarView buildQuestionGroups(BuildContext context) {
    final children = <Widget>[];
    for (final g in widget.groups) {
      children.add(Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: QuestionGroupWidget(g, widget.elections)));
    }
    return TabBarView(controller: _tabController, children: children);
  }

  void previousGroup() => _tabController.animateTo(_tabController.index - 1);

  void nextGroup() => _tabController.animateTo(_tabController.index + 1);

  void submitAnswers(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResultsScreen(widget.elections)));
  }

  Widget buildNavigationRow() {
    return Row(children: [
      ElevatedButton(onPressed: previousGroup, child: const Text('Previous')),
      const Spacer(),
      ElevatedButton(onPressed: nextGroup, child: const Text('Next')),
      ElevatedButton(onPressed: () => submitAnswers(context), child: const Text('Submit'))
    ]);
  }
}
