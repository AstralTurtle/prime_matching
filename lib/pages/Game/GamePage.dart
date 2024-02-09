import 'package:flutter/material.dart';
import 'package:prime_matching/services/apihelper.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  List<Image> imgs = [];

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
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
      ),
      body: SingleChildScrollView(child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
            imgs
        )
      ),
    ));
  }
}