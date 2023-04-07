import 'package:flutter/material.dart';
import 'package:training_app_5/screens/complete_tasks.dart';

import 'all_tasks.dart';
import 'incomplete_tasks.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> titles = ["All Tasks", "Complete Tasks", "InComplete Tasks"];
  int currentPageIndex = 0;
  PageController pc = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[currentPageIndex]),),
      body: PageView(
        controller: pc,
        onPageChanged: (v){
          currentPageIndex =  v;
          setState(() {
          });
        },
        children: [
          AllTasks(),
          CompleteTasks(),
          InCompleteTasks(),
        ],
      ),
    );
  }
}
