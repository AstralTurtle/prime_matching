import 'dart:convert';
import 'package:http/http.dart' as http;

class APIhelper{
  static APIhelper _instance = APIhelper._internal();

  factory APIhelper() => _instance;

  APIhelper._internal();

  Future<Imag
}