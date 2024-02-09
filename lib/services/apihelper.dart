import 'dart:convert';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
class APIhelper{
  static APIhelper _instance = APIhelper._internal();

  factory APIhelper() => _instance;

  APIhelper._internal();

  Future<List<Image>> testLocal(){
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
        List<Image> imgList = [];
        for (var image in images) {
          var imgdata = Base64Decoder().convert(image);
          imgList.add(Image.memory(imgdata));
          
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