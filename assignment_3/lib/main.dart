import 'package:flutter/material.dart';

void main() {
  runApp(SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff4C6EF5),
        scaffoldBackgroundColor: Color(0xffF5F7FB),

        cardTheme: CardThemeData(
          color: Colors.white,
          shadowColor: Colors.black12,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),

        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
      home: DashboardScreen(),
    );
  }
}

/* ───────────────── Dashboard Screen ───────────────── */

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> devices = [
    {
      "name": "Living Room Light",
      "type": "Light",
      "room": "Living Room",
      "status": false,
      "brightness": 50,
      "icon": Icons.lightbulb_outline
    },
    {
      "name": "Bedroom Fan",
      "type": "Fan",
      "room": "Bedroom",
      "status": true,
      "brightness": 70,
      "icon": Icons.air
    },
    {
      "name": "Main Door Camera",
      "type": "Camera",
      "room": "Entrance",
      "status": true,
      "brightness": 0,
      "icon": Icons.cameraswitch_outlined
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Home Dashboard"),
        centerTitle: true,
        backgroundColor: Color(0xff4C6EF5),
        elevation: 3,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),

            // FIXED: NO ASSET NEEDED
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.black),
            ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: devices.length,

          // FIXED — CARD SIZE NOW PERFECT
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.78,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),

          itemBuilder: (context, index) {
            return DeviceCard(
              device: devices[index],
              onUpdate: () => setState(() {}),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DeviceDetailScreen(
                      device: devices[index],
                      onUpdate: () => setState(() {}),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff4C6EF5),
        child: Icon(Icons.add, size: 32),
        onPressed: () => _openAddDialog(),
      ),
    );
  }

  void _openAddDialog() {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController roomCtrl = TextEditingController();

    String? selectedType;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("Add New Device"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(labelText: "Device Name"),
              ),
              TextField(
                controller: roomCtrl,
                decoration: InputDecoration(labelText: "Room Name"),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Device Type"),
                items: ["Light", "Fan", "AC", "Camera"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (val) => selectedType = val,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: Text("Add"),
              onPressed: () {
                if (selectedType == null ||
                    nameCtrl.text.isEmpty ||
                    roomCtrl.text.isEmpty) return;

                setState(() {
                  devices.add({
                    "name": nameCtrl.text,
                    "type": selectedType,
                    "room": roomCtrl.text,
                    "status": false,
                    "brightness": 50,
                    "icon": selectedType == "Light"
                        ? Icons.lightbulb_outline
                        : selectedType == "Fan"
                            ? Icons.air
                            : selectedType == "AC"
                                ? Icons.ac_unit
                                : Icons.camera_alt_outlined,
                  });
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

/* ───────────────── Device Card ───────────────── */

class DeviceCard extends StatefulWidget {
  final Map device;
  final VoidCallback onUpdate;
  final VoidCallback onTap;

  DeviceCard({required this.device, required this.onUpdate, required this.onTap});

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => scale = 0.95),
      onTapUp: (_) {
        setState(() => scale = 1);
        widget.onTap();
      },
      onTapCancel: () => setState(() => scale = 1),
      child: AnimatedScale(
        scale: scale,
        duration: Duration(milliseconds: 120),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.device["icon"], size: 42, color: Color(0xff4C6EF5)),
                SizedBox(height: 8),
                Text(widget.device["name"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(widget.device["room"], style: TextStyle(color: Colors.grey, fontSize: 13)),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.device["status"] ? "ON" : "OFF",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      value: widget.device["status"],
                      activeColor: Color(0xff4C6EF5),
                      onChanged: (val) {
                        setState(() {
                          widget.device["status"] = val;
                          widget.onUpdate();
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ───────────────── Device Detail Screen ───────────────── */

class DeviceDetailScreen extends StatefulWidget {
  final Map device;
  final VoidCallback onUpdate;

  DeviceDetailScreen({required this.device, required this.onUpdate});

  @override
  _DeviceDetailScreenState createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.device["name"]),
        backgroundColor: Color(0xff4C6EF5),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(widget.device["icon"], size: 120, color: Color(0xff4C6EF5)),
            SizedBox(height: 20),

            Text(
              "Status: ${widget.device["status"] ? "ON" : "OFF"}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Switch(
              value: widget.device["status"],
              activeColor: Color(0xff4C6EF5),
              onChanged: (value) {
                setState(() {
                  widget.device["status"] = value;
                  widget.onUpdate();
                });
              },
            ),

            if (widget.device["type"] != "Camera")
              Column(
                children: [
                  SizedBox(height: 20),
                  Text("Brightness / Speed"),
                  Slider(
                    value: widget.device["brightness"].toDouble(),
                    min: 0,
                    max: 100,
                    activeColor: Color(0xff4C6EF5),
                    onChanged: (value) {
                      setState(() {
                        widget.device["brightness"] = value.toInt();
                        widget.onUpdate();
                      });
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
