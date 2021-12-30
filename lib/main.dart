import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';
/* 
void main() {
  runApp(MyApp());
} */

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 10}
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Dog', 'score': 1},
        {'text': 'Wolf', 'score': 10},
        {'text': 'Chicken', 'score': 6}
      ],
    },
    {
      'questionText': 'Who\'s your favourite footballer?',
      'answers': [
        {'text': 'Messi', 'score': 1},
        {'text': 'Ronaldo', 'score': 3},
        {'text': 'Lewandoski', 'score': 6},
        {'text': 'Neymar', 'score': 10}
      ],
    },
    {
      'questionText': 'What team do you support?',
      'answers': [
        {'text': 'Arsenal', 'score': 1},
        {'text': 'Barca', 'score': 3},
        {'text': 'Chelsea', 'score': 6},
        {'text': 'Manchester United', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
