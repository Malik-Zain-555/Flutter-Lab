import 'package:flutter/material.dart';

void main() {
  runApp(const TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  const TravelGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Guide App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const TravelHome(),
    );
  }
}

class TravelHome extends StatefulWidget {
  const TravelHome({super.key});
  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  int index = 0;

  final pages = [
    const HomeScreen(),
    const ListScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Travel Guide")),
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.teal,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
        ],
      ),
    );
  }
}

/* ========================= HOME SCREEN ========================= */
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final destCtrl = TextEditingController();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Welcome to Travel Guide App! Explore top destinations around the world.",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          const Text.rich(TextSpan(
            text: "Explore the ",
            style: TextStyle(fontSize: 20),
            children: [
              TextSpan(
                  text: "World ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.teal)),
              TextSpan(
                  text: "with Us!",
                  style: TextStyle(color: Colors.orange, fontSize: 20)),
            ],
          )),
          const SizedBox(height: 20),
          TextField(
            controller: destCtrl,
            decoration: const InputDecoration(
              labelText: "Enter destination name",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Searching for ${destCtrl.text}")),
              );
            },
            child: const Text("Search Destination"),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Thanks for exploring with us!")),
              );
            },
            child: const Text("Say Hello"),
          ),
        ],
      ),
    );
  }
}

/* ========================= LIST SCREEN ========================= */
class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  final destinations = const [
    {'name': 'Paris', 'desc': 'The city of light and romance.'},
    {'name': 'Tokyo', 'desc': 'A futuristic mix of culture and tech.'},
    {'name': 'New York', 'desc': 'The city that never sleeps.'},
    {'name': 'Dubai', 'desc': 'Luxury, desert, and skyscrapers.'},
    {'name': 'Sydney', 'desc': 'Home to the Opera House.'},
    {'name': 'Istanbul', 'desc': 'Where East meets West.'},
    {'name': 'Cairo', 'desc': 'Land of the pyramids.'},
    {'name': 'Rome', 'desc': 'Ancient city of art and history.'},
    {'name': 'Bali', 'desc': 'Island of gods and beaches.'},
    {'name': 'London', 'desc': 'A royal city full of heritage.'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: destinations.length,
      itemBuilder: (context, i) {
        final place = destinations[i];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.place, color: Colors.teal),
            title: Text(place['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(place['desc']!),
          ),
        );
      },
    );
  }
}

/* ========================= ABOUT SCREEN ========================= */
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  final attractions = const [
    {
      'img': 'https://images.unsplash.com/photo-1502602898657-3e91760cbb34',
      'name': 'Eiffel Tower'
    },
    {
      'img': 'https://images.unsplash.com/photo-1518684079-4b1c0e1cffa2',
      'name': 'Great Wall'
    },
    {
      'img': 'https://images.unsplash.com/photo-1526778548025-fa2f459cd5c1',
      'name': 'Colosseum'
    },
    {
      'img': 'https://images.unsplash.com/photo-1564501049412-61c2a3083791',
      'name': 'Taj Mahal'
    },
    {
      'img': 'https://images.unsplash.com/photo-1526483360412-f4dbaf036963',
      'name': 'Statue of Liberty'
    },
    {
      'img': 'https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d',
      'name': 'Sydney Opera House'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: attractions.length,
      itemBuilder: (context, i) {
        final place = attractions[i];
        return Card(
          elevation: 4,
          child: Column(
            children: [
              Expanded(
                child: Image.network(place['img']!, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  place['name']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
