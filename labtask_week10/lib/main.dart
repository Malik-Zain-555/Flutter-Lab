import 'package:flutter/material.dart';
import 'package:labtask_week10/Screens/gridview_count.dart';
import 'package:labtask_week10/Screens/gridview_extent.dart';
import 'package:labtask_week10/Screens/listviewpage.dart';
import 'package:labtask_week10/Screens/sliverappbarpage.dart';
import 'package:labtask_week10/Screens/stackpage.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
final List<Widget> pages = [Listviewpage(),GridviewCount(), GridviewExtent(), Stackpage(), Sliverappbarpage()];
int pageChanger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text(
          "Creating Scrolling Lists and Effects",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:  pages[pageChanger],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilledButton(onPressed: () {setState(() {
              pageChanger = 0;
            });}, child: Text("List View")),
            FilledButton(onPressed: () {setState(() {
              pageChanger = 1;
            });}, child: Text("Grid Count")),
            FilledButton(onPressed: () {setState(() {
              pageChanger = 2;
            });}, child: Text("Grid Extent")),
            FilledButton(onPressed: () {setState(() {
              pageChanger = 3;
            });}, child: Text("Stack")),
            FilledButton(onPressed: () {setState(() {
              pageChanger = 4;
            });}, child: Text("SliverAppBar")),
          ],
        ),
      ),
    );
  }
}
