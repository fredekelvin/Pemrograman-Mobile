import 'package:flutter/material.dart';
import 'package:tugas_week_9/layout/model/Getnews.dart';
import 'Detailnewspage.dart';

class Newscard extends StatelessWidget {
  const Newscard({super.key, required this.getnews});
  final Getnews getnews;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return Detailnewspage(getnews: getnews);
            }),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getnews.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(getnews.body),
          ],
        ),
      ),
    );
  }
}
