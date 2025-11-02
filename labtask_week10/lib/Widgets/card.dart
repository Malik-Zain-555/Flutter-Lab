import 'package:flutter/material.dart';
import 'dart:ui';


class Cards extends StatelessWidget {
  final Color color;
  final String title;

  const Cards(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:  Container(height: 75, width: 75, color: color, child: Text(title)),
  );
  }
}


