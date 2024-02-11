import 'package:flutter/material.dart';
import 'package:prime_matching/models/graph.dart';

class GraphTile extends StatefulWidget {
  final Graph graph;
  const GraphTile({required this.graph, super.key});

  @override
  State<GraphTile> createState() => _GraphTileState();
}

class _GraphTileState extends State<GraphTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.purple,
      title: SizedBox(
        height: 250,
        child: widget.graph.image,
      ),
      // title: Text("test ${widget.graph.index}"),
      visualDensity: const VisualDensity(horizontal: 1),
    );
  }
}
