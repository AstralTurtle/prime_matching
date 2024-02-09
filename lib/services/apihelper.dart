import 'dart:convert';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:prime_matching/models/graph.dart';
class APIhelper{
  static APIhelper _instance = APIhelper._internal();

  factory APIhelper() => _instance;

  APIhelper._internal();

  Future<List<Graph>> testLocal(){
    Uri uri = Uri.http('localhost:5000', "/");
    return http.get(uri).then((response) {
      // response to json'
      // print(response);
      var data = jsonDecode(response.body);
      print(data["code"]);
      // print(data["images"]);
      // have to refactor api properly xddd
      if (data["code"] == 200) {
        
        // get images array
        var images = data["response"]["images"];
        List<Graph> imgList = [];

        for (int i = 0; i < images.length; i++){
          var imgdata = Base64Decoder().convert(images[i]);

          imgList.add(Graph(index: i, image: Image.memory(imgdata)));
        }

        print("success");
        return imgList;
      } else {
        throw Exception('Failed to get image');

      }
    
    });
  }

  // Image<Convert>


}

void main(List<String> args) {
  APIhelper().testLocal();
}