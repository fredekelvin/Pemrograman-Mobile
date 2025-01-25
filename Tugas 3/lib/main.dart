import 'package:flutter/material.dart';
import 'package:tugas_week_9/layout/home/homepagemenu.dart';
import 'package:tugas_week_9/layout/home/MyHomePage.dart';
import 'package:tugas_week_9/layout/home/Newspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('My Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            title: Text('News Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Newspage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
