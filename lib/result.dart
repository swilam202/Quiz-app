import 'package:flutter/material.dart';
import 'math.dart';

class Result extends StatefulWidget {
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int res = score;

  String pic() {
    if (score >= 5) {
      return ('images/happy.png');
    } else {
      return ('images/disapp.png');
    }
  }

  void restart(BuildContext ctx) {
    setState(() {
      selectedQuestionIndex = 0;
      score = 0;
      Navigator.of(ctx).pushReplacementNamed('math');
    });
  }

  Color backgr() {
    if (score >= 5) {
      return (Colors.green);
    } else {
      return (Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgr(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Score Is :',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                ' $score / 10 ',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                pic(),
                scale: 2.5,
              ),
              TextButton.icon(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(Colors.amberAccent),
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30))),
                onPressed: () => restart(context),
                label: const Text('Restart The Quiz'),
                icon: const Icon(Icons.restart_alt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
