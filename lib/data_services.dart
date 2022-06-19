import 'dart:convert';

import 'package:bloc_practise04/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataServices {
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      final json = jsonDecode(response.body) as List;
      final posts = json.map((postJson) => Post.fromJson(postJson)).toList();
      return posts;
    } catch (e) {
      throw (e.toString());
    }
  }
}
