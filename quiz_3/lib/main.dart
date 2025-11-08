import 'package:flutter/material.dart';

void main() => runApp(const FlashQuizApp());

class FlashQuizApp extends StatelessWidget {
  const FlashQuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Quiz',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[50],
        useMaterial3: true,
      ),
      home: const FlashHome(),
    );
  }
}

class Flashcard {
  final String q;
  final String a;
  bool showAnswer;
  Flashcard(this.q, this.a, {this.showAnswer = false});
}

class FlashHome extends StatefulWidget {
  const FlashHome({super.key});
  @override
  State<FlashHome> createState() => _FlashHomeState();
}

class _FlashHomeState extends State<FlashHome> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Flashcard> _cards = [];
  int learned = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    final data = [
      Flashcard("What is Flutter?", "A UI toolkit by Google."),
      Flashcard("Widget tree?", "It represents UI hierarchy."),
      Flashcard("setState does what?", "Triggers rebuild of StatefulWidget."),
      Flashcard("Hot reload vs restart?", "Reload keeps state; restart resets."),
      Flashcard("What is BuildContext?", "Gives access to widget location info."),
    ];
    _cards.clear();
    for (int i = 0; i < data.length; i++) {
      _cards.add(data[i]);
    }
    setState(() => learned = 0);
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _load();
  }

  void _toggle(Flashcard c) {
    setState(() => c.showAnswer = !c.showAnswer);
  }

  void _addCard() async {
    final c = await showDialog<Flashcard>(
      context: context,
      builder: (ctx) => const AddCardDialog(),
    );
    if (c != null) {
      _cards.insert(0, c);
      _listKey.currentState?.insertItem(0);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = _cards.length + learned;
    final progress = total == 0 ? 0.0 : learned / total;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flash Quiz"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addCard,
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 6),
                  Text(
                    "$learned of $total learned",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _cards.length,
                itemBuilder: (ctx, i, anim) {
                  if (i >= _cards.length) return const SizedBox();
                  final c = _cards[i];
                  return SizeTransition(
                    sizeFactor: anim,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Dismissible(
                        key: ValueKey(c.q),
                        direction: DismissDirection.horizontal,
                        onDismissed: (_) {
                          setState(() {
                            _cards.removeAt(i);
                            learned++;
                          });
                        },
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Icon(Icons.check, color: Colors.teal),
                        ),
                        secondaryBackground: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.check, color: Colors.teal),
                        ),
                        child: GestureDetector(
                          onTap: () => _toggle(c),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: c.showAnswer
                                    ? [Colors.teal.shade100, Colors.teal.shade200]
                                    : [Colors.white, Colors.grey.shade100],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.q,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: c.showAnswer
                                        ? Colors.teal.shade800
                                        : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                AnimatedCrossFade(
                                  firstChild: const Text(
                                    "Tap to reveal",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  secondChild: Text(
                                    c.a,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black87),
                                  ),
                                  crossFadeState: c.showAnswer
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration:
                                  const Duration(milliseconds: 200),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardDialog extends StatefulWidget {
  const AddCardDialog({super.key});

  @override
  State<AddCardDialog> createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  final _q = TextEditingController();
  final _a = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add New Card"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: _q, decoration: const InputDecoration(labelText: "Question")),
          const SizedBox(height: 8),
          TextField(controller: _a, decoration: const InputDecoration(labelText: "Answer")),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        FilledButton(
          onPressed: () {
            if (_q.text.isNotEmpty && _a.text.isNotEmpty) {
              Navigator.pop(context, Flashcard(_q.text, _a.text));
            }
          },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
