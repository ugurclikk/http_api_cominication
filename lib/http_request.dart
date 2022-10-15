import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future getRequest() async {
  try {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=46457b93dd5b464d86708b0806158c6c"));
    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
}
