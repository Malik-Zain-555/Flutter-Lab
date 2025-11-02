import 'package:flutter/material.dart';

class Stackpage extends StatefulWidget {
  const Stackpage({super.key});

  @override
  State<Stackpage> createState() => _StackpageState();
}

class _StackpageState extends State<Stackpage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 200, height: 200, color: Colors.blue),
          Container(width: 150, height: 150, color: Colors.green),
          Container(width: 100, height: 100, color: Colors.yellow),
          const Text(
            'Stacked!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
