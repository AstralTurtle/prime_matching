
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

  @override
  void initState() {
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
    List<GraphTile> graphTiles = imgs.map((e) => GraphTile(graph: e, key: UniqueKey(),)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
      ),
      body: ReorderableListView( children: 
            graphTiles,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final Graph item = imgs.removeAt(oldIndex);
                imgs.insert(newIndex, item);
              });
            },
        
      
      
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        setState(() {
        for (int i = 0; i < graphTiles.length; i++){
          print(graphTiles[i].graph.isCorrect(i));
        }
        });
    }
    )
    ,
    );
    
  }
}