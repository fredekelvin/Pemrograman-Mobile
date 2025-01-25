import 'package:flutter/material.dart';
import 'package:tugas_week_9/layout/model/Getnews.dart';

class Detailnewspage extends StatelessWidget {
  final Getnews getnews;

  const Detailnewspage({super.key, required this.getnews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ), // AppBar
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'id: ${getnews.id}',
            ), // Text
            Text('Title: ${getnews.title}'),
            const SizedBox(
              height: 20,
            ), // SizedBox
            const Text('Body: '),
            Text(getnews.body)
          ],
        ),
      ), // SafeArea
    ); // Scaffold
  }
}
