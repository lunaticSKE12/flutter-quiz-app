import 'package:flutter/material.dart';
import 'package:patterns_canvas/patterns_canvas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomPaint(
        painter: ContainerPatternPainter(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Quiz App'),
            elevation: 0,
          ),
          body: Home(),
        ),
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
  int score = 0;
  int quizNumber = 1;

  Map<int, Map<String, dynamic>> quizLists = {
    1: {"q": "แมวเป็นสัตว์เลี้ยงลูกด้วยนม มี 4 ขา ใช่หรือไม่?", "a": true},
    2: {
      "q": "ดาวเคราะห์ที่อยู่ใกล้ดวงอาทิตย์ที่สุดคือดาวเสาร์ ใช่หรือไม่?",
      "a": false
    },
    3: {
      "q": "Unicorn เป็นสัตว์ท้องถิ่นของประเทศ Scotland ใช่หรือไม่?",
      "a": true
    },
  };

  void submit(bool answer) {
    if (quizLists[quizNumber]!['a'] == answer) {
      score++;
    }

    if (quizNumber == quizLists.length) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                "Congratulations!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.teal),
              ),
              content: Text(
                "Your score is $score / ${quizLists.length}",
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        quizNumber = 1;
                        score = 0;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "RESTART QUIZ",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            );
          });
    } else {
      setState(() {
        quizNumber++;
      });
    }
    print(score);
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quiz No. ${quizNumber}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text('$quizNumber/${quizLists.length}')
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${quizLists[quizNumber]!["q"]}',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    minimumSize: Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    )),
                onPressed: () => submit(true),
                icon: Icon(Icons.check),
                label: Text(
                  "TRUE",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: Size(double.infinity, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    )),
                onPressed: () => submit(false),
                icon: Icon(Icons.close),
                label: Text(
                  "FALSE",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContainerPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Checkers(
            featuresCount: 5,
            bgColor: Colors.deepPurple.shade300,
            fgColor: Colors.grey.shade200.withOpacity(0.1))
        .paintOnWidget(canvas, size);
    // HorizontalStripesLight(
    //         bgColor: Color(0xff0509050), fgColor: Color(0xfffdbf6f))
    //     .paintOnWidget(canvas, size);
    // VerticalStripesThick(
    //         bgColor: Color(0xff0509050), fgColor: Color(0xfffdbf6f))
    //     .paintOnWidget(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
