import 'package:elections_match/models/data.dart';
import 'package:elections_match/models/firebase_data_model.dart';
import 'package:elections_match/screens/elections_screen.dart';
import 'package:elections_match/widgets/elections_item.dart';
import 'package:elections_match/widgets/styles.dart';
import 'package:error_or/error_or.dart';
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
    // dataModel = FakeDataModel(FakeDataDefinition());
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
  ErrorOr<List<Elections>>? data;

  final errorStyle =
      const TextStyle(color: Colors.deepOrangeAccent, fontSize: 14, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    loadData(widget.dataModel);
  }

  void loadData(DataModel dataModel) async {
    var tempData = await ErrorOr.wrap(dataModel.getElections);
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
      body: constructBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Help',
        child: const Icon(Icons.help),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget constructBody() {
    if (data == null) {
      return const Padding(
          padding: EdgeInsets.all(16),
          child: LinearProgressIndicator(
            minHeight: 10,
          ));
    }

    if (data!.hasError) {
      return Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Error loading data: ${data!.error}', style: errorStyle));
    }

    return Center(child: ListView.builder(itemCount: data!.value.length, itemBuilder: itemBuilder));
  }

  Widget itemBuilder(BuildContext context, int index) {
    return GestureDetector(
        onTap: () => electionSelected(data!.value[index]),
        child: MouseRegion(
            cursor: SystemMouseCursors.click, child: ElectionsListItem(data!.value[index])));
  }

  electionSelected(Elections elections) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ElectionsScreen(widget.dataModel, elections)));
  }
}
