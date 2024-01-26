import 'package:elections_match/models/data.dart';
import 'package:elections_match/models/firebase_data_model.dart';
import 'package:elections_match/screens/elections_screen.dart';
import 'package:elections_match/widgets/elections_item.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final DataModel dataModel;

  MyApp({super.key}) {
    // dataModel = FakeDataModel();
    dataModel = FirebaseDataModel();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elections Match from VoteHappy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: HomePage(dataModel, title: 'Elections Match from VoteHappy'),
    );
  }
}

class HomePage extends StatefulWidget {
  final DataModel dataModel;

  const HomePage(this.dataModel, {super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Elections>? data;

  @override
  void initState() {
    super.initState();
    loadData(widget.dataModel);
  }

  void loadData(DataModel dataModel) async {
    var tempData = await dataModel.loadElections();
    setState(() {
      data = tempData;
    });
  }

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
      body: data == null
          ? const Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                minHeight: 10,
              ))
          : Center(child: ListView.builder(itemCount: data!.length, itemBuilder: itemBuilder)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Help',
        child: const Icon(Icons.help),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => electionSelected(data![index]),
        child:
            MouseRegion(cursor: SystemMouseCursors.click, child: ElectionsListItem(data![index])));
  }

  electionSelected(Elections elections) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ElectionsScreen(elections)));
  }
}
