// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quiz_app2/result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your college name?',
      'answers': [
        {'text': 'COEP', 'score': 10},
        {'text': 'VJIT', 'score': 8},
        {'text': 'MIT', 'score': 7},
        {'text': 'Raisoni', 'score': 10},
      ],
    },
    {
      'questionText': 'Select Your Field',
      'answers': [
        {'text': 'Web Developer', 'score': 7},
        {'text': 'App Developer', 'score': 10},
        {'text': 'Cyber Security', 'score': 8},
        {'text': 'Data Science', 'score': 7},
      ],
    },
    {
      'questionText': 'What is your score in last sem?',
      'answers': [
        {'text': '90', 'score': 10},
        {'text': '80', 'score': 8},
        {'text': '70', 'score': 7},
        {'text': '60', 'score': 6},
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
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
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
