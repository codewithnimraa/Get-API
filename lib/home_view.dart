import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  getPosts() async {
    var url = Uri.http("jsonplaceholder.typicode.com", "/posts");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    // ignore: avoid_print
    print(responseBody[0]["body"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                getPosts();
              },
              child: const Text("Get Posts")),
        ],
      )),
    );
  }
}
