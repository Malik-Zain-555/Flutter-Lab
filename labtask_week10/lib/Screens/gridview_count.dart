import 'package:flutter/material.dart';
import 'package:labtask_week10/Widgets/card.dart';

class GridviewCount extends StatelessWidget {
  const GridviewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.count(
        crossAxisCount: 3,
        children: [
          Cards("1", Colors.redAccent),
          Cards("2", Colors.greenAccent),
          Cards("3", Colors.blueAccent),
          Cards("4", Colors.orangeAccent),
          Cards("5", Colors.yellowAccent),
          Cards("6", Colors.brown),
          Cards("7", Colors.grey),
          Cards("8", Colors.cyanAccent),
          Cards("9", Colors.deepPurple),
          Cards("10", Colors.deepOrangeAccent),
          Cards("11", Colors.lightGreen),
          Cards("12", Colors.pink),
        ],
    );
  }
}
