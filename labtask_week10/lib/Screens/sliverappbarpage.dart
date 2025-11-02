import 'package:flutter/material.dart';

class Sliverappbarpage extends StatefulWidget {
  const Sliverappbarpage({super.key});

  @override
  State<Sliverappbarpage> createState() => _SliverappbarpageState();
}

class _SliverappbarpageState extends State<Sliverappbarpage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('SliverAppBar Demo', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            background: Image.network(
              'https://picsum.photos/400/200',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Item #$index'),
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
