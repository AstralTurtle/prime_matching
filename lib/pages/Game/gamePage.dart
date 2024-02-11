import 'package:flutter/material.dart';
import 'package:prime_matching/Widgets/graphTile.dart';
import 'package:prime_matching/models/graph.dart';
import 'package:prime_matching/services/apihelper.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<Graph> imgs = [];
  int score = 0;
  @override
  void initState() {
    // replace with getResponse() for prod
    APIhelper().testLocal().then((value) {
      setState(() {
        imgs = value;
        // randomize the image order
        imgs.shuffle();
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<GraphTile> graphTiles = imgs
        .map((e) => GraphTile(
              graph: e,
              key: UniqueKey(),
            ))
        .toList();
    for (int i = 0; i < imgs.length; i++) {
      print(imgs[i].index);
    }

    _addScore() {
      score++;
    }

    return Scaffold(
      appBar: AppBar(
        // cursed (idk why appbar has no trailing parameter)
        title: Text('Score: $score'),
      ),
      body: Center(
          child: ReorderableListView(
        children: graphTiles,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final Graph item = imgs.removeAt(oldIndex);
            imgs.insert(newIndex, item);
          });
        },
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          for (int i = 0; i < graphTiles.length; i++) {
            if (graphTiles[i].graph.isCorrect(i)) {
              _addScore();
            }
          }
        });
      }),
    );
  }
}
