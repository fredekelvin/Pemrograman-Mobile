import 'package:flutter/material.dart';
import 'package:tugas_week_9/layout/model/Getnews.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'apiPage/NewsCard.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  Future<List<Getnews>> fetchPosts() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      var listPosts = getPostsData.map((i) => Getnews.fromJson(i)).toList();
      return listPosts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  late Future<List<Getnews>> futurePosts;

  @override
  void initState() {
    futurePosts = fetchPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
        centerTitle: true,
      ), // AppBar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ), // EdgeInsets.symmetric
          child: FutureBuilder<List<Getnews>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: ((context, index) {
                        var post = (snapshot.data as List<Getnews>)[index];
                        return Column(
                          children: [
                            Newscard(
                              getnews: Getnews(
                                id: post.id,
                                title: post.title,
                                body: post.body,
                              ), // Getnews
                            ), // Newscard
                            const SizedBox(height: 20),
                          ],
                        ); // Column
                      }), // itemBuilder
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: (snapshot.data as List<Getnews>).length);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }), // FutureBuilder
        ), // Padding
      ), // SafeArea
    ); // Scaffold
  }
}
