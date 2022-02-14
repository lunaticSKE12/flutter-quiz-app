import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade300,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Quiz App'),
          elevation: 0,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      margin: EdgeInsets.only(top: 26, left: 16, right: 16, bottom: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quiz No.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Text('/')
            ],
          ),
          SizedBox(
            child: Divider(height: 0),
            height: 30,
          ),
          Text(
            "Please answer this question : ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}
