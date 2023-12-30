import 'package:elections_match/models/data.dart';
import 'package:elections_match/widgets/elections_item.dart';
import 'package:elections_match/screens/elections_screen.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:flutter/material.dart';

import 'models/fake_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elections Match from VoteHappy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),

      home: const HomePage(title:  'Elections Match from VoteHappy'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor(context),
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(itemCount: fakeElections.length, itemBuilder: itemBuilder)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Help',
        child: const Icon(Icons.help),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => electionSelected(fakeElections[index]),
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ElectionsListItem(fakeElections[index])));
  }

  electionSelected(Elections elections) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ElectionsScreen(elections)));
  }

}
