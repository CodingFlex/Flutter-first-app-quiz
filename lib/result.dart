import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'You know ball!';
    } else if (resultScore <= 10) {
      resultText = 'You\'re a\'ight I guess';
    } else if (resultScore <= 16) {
      resultText = 'Nah man, fix up this ain\'t it';
    } else {
      resultText = 'Nah, you\'re too far gone. No hope';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.red,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
