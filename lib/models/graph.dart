import 'package:flutter/material.dart';

class Graph {
  int index;
  Image image;

  Graph({required this.index, required this.image});

  bool isCorrect(int guess){
    if (guess == index){
      return true;
    } else {
      return false;
    }
  }  
}