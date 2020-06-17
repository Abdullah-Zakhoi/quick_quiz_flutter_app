import 'package:flutter/material.dart';
import 'package:flutter_alert/flutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuickQuiz(),
          ),
        ),
      ),
    );
  }
}

class QuickQuiz extends StatefulWidget {
  @override
  _QuickQuizState createState() => _QuickQuizState();
}

class _QuickQuizState extends State<QuickQuiz> {
  int indexNumber = 0;
  List questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
    'It is illegal to pee in the Ocean in Portugal.',
  ];
  List answers = [
    true,
    false,
    true,
    true,
    true,
  ];
  List<Icon> results = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[indexNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (answers[indexNumber] == true) {
                    results.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    results.add(
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                    );
                  }
                  if (indexNumber < questions.length - 1) {
                    indexNumber = indexNumber + 1;
                  } else {
                    indexNumber = 0;
                    showAlert(
                      context: context,
                      title: "Good job",
                      body: "you finished your quiz",
                      actions: [
                        AlertAction(
                          text: "start again",
                          isDestructiveAction: true,
                          onPressed: () {
                            setState(() {
                              results.clear();
                            });
                          },
                        ),
                      ],
                      cancelable: false,
                    );
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (answers[indexNumber] == false) {
                    results.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    results.add(
                      Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                    );
                  }
                  if (indexNumber < questions.length - 1) {
                    indexNumber = indexNumber + 1;
                  } else {
                    indexNumber = 0;
                    showAlert(
                      context: context,
                      title: "Good job",
                      body: "you finished your quiz",
                      actions: [
                        AlertAction(
                          text: "start again",
                          isDestructiveAction: true,
                          onPressed: () {
                            setState(() {
                              results.clear();
                            });
                          },
                        ),
                      ],
                      cancelable: false,
                    );
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: results,
        )
      ],
    );
  }
}
