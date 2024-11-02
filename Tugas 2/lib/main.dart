import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click on The Boxes!!!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showFirstEmoji = false;
  bool _showSecondEmoji = false;
  bool _showThirdEmoji = false;
  bool _showFourthEmoji = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Click on The Boxes!!!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: CloudPainter(_animation.value),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                buildGridTile(_showFirstEmoji ? '😊' : '', () {
                  setState(() {
                    _showFirstEmoji = !_showFirstEmoji;
                  });
                }),
                buildGridTile(_showSecondEmoji ? '🤗' : '', () {
                  setState(() {
                    _showSecondEmoji = !_showSecondEmoji;
                  });
                }),
                buildGridTile(_showThirdEmoji ? '😎' : '', () {
                  setState(() {
                    _showThirdEmoji = !_showThirdEmoji;
                  });
                }),
                buildGridTile(_showFourthEmoji ? '🤔' : '', () {
                  setState(() {
                    _showFourthEmoji = !_showFourthEmoji;
                  });
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildGridTile(String emoji, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Center(
          child: Text(
            emoji,
            style: TextStyle(
              fontSize: 100,
              fontFamily: 'Emoji',
            ),
          ),
        ),
      ),
    );
  }
}

class CloudPainter extends CustomPainter {
  final double offset;

  CloudPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.lightBlue;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    paint.color = Colors.white;
    double cloudWidth = 100;
    double cloudHeight = 60;

    for (double i = -cloudWidth; i < size.width + cloudWidth; i += cloudWidth * 2) {
      for (double j = 0; j < size.height; j += cloudHeight * 3) {
        canvas.drawOval(Rect.fromLTWH(i + (size.width * offset), j, cloudWidth, cloudHeight), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
