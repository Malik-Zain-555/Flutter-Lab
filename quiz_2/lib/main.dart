import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController myController = TextEditingController();
  String username = "ZIKAKITO";

  void getNewUserValue() {
    setState(() {
      username = myController.text;
    });
    print("Username Changed!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Profile Screen"),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Image(image: AssetImage('assets/Man.jpg'), width: 200),
            RichText(
              text: TextSpan(
                text: username,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Click")),
                TextButton(onPressed: () {}, child: Text("Click")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.redAccent,
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Asslamualikum, My name is ZIKAKITO and I'm an App Dev.",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController,
                cursorColor: Colors.green,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Change Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(onPressed: getNewUserValue, child: Text("Change")),
          ],
        ),
      ),
    );
  }
}
