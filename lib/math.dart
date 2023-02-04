import 'package:flutter/material.dart';

class Mathquiz extends StatefulWidget {
  @override
  State<Mathquiz> createState() => _MathquizState();
}

int score = 0;
int selectedQuestionIndex = 0;
int chosenAnswerIndex = 0;

class _MathquizState extends State<Mathquiz> {
  List mathQA = [
    {
      'question': 'What is the sum of 130+125+191?',
      'answer': [
        {'ans': 335, 'sc': 0},
        {'ans': 456, 'sc': 1},
        {'ans': 446, 'sc': 0},
        {'ans': 426, 'sc': 0},
      ],
    },
    {
      'question': 'If we minus 712 from 1500, how much do we get?',
      'answer': [
        {'ans': 788, 'sc': 0},
        {'ans': 788, 'sc': 0},
        {'ans': 768, 'sc': 1},
        {'ans': 758, 'sc': 0},
      ]
    },
    {
      'question': '50 times of 8 is equal to:',
      'answer': [
        {'ans': 80, 'sc': 0},
        {'ans': 400, 'sc': 1},
        {'ans': 800, 'sc': 0},
        {'ans': 4000, 'sc': 0},
      ]
    },
    {
      'question': '110 divided by 10 is:',
      'answer': [
        {'ans': 11, 'sc': 1},
        {'ans': 5, 'sc': 0},
        {'ans': 8, 'sc': 0},
        {'ans': 10, 'sc': 0},
      ]
    },
    {
      'question': '20+(90÷2) is equal to:',
      'answer': [
        {'ans': 50, 'sc': 0},
        {'ans': 55, 'sc': 0},
        {'ans': 65, 'sc': 1},
        {'ans': 60, 'sc': 0},
      ]
    },
    {
      'question': 'The product of 82 and 5 is:',
      'answer': [
        {'ans': 400, 'sc': 0},
        {'ans': 410, 'sc': 1},
        {'ans': 450, 'sc': 0},
        {'ans': 420, 'sc': 0},
      ]
    },
    {
      'question': 'Find the missing terms in multiple of 3: 3, 6, 9, __, 15',
      'answer': [
        {'ans': 10, 'sc': 0},
        {'ans': 11, 'sc': 0},
        {'ans': 12, 'sc': 1},
        {'ans': 13, 'sc': 0},
      ]
    },
    {
      'question': 'Solve 24÷8+2.',
      'answer': [
        {'ans': 5, 'sc': 1},
        {'ans': 6, 'sc': 0},
        {'ans': 8, 'sc': 0},
        {'ans': 12, 'sc': 0},
      ]
    },
    {
      'question': 'Solve: 300 – (150×2)',
      'answer': [
        {'ans': 150, 'sc': 0},
        {'ans': 100, 'sc': 0},
        {'ans': 50, 'sc': 0},
        {'ans': 0, 'sc': 1},
      ]
    },
    {
      'question': 'The product of 121 x 0 x 200 x 25 is',
      'answer': [
        {'ans': 1500, 'sc': 0},
        {'ans': 0, 'sc': 1},
        {'ans': 4000, 'sc': 0},
        {'ans': 10, 'sc': 0},
      ]
    },
  ];

  void selected(int x, BuildContext ctx) {
    setState(() {
      selectedQuestionIndex++;
      score += x;
      if (selectedQuestionIndex == mathQA.length) {
        Navigator.of(ctx).pushReplacementNamed('res');
      }
    });
  }

  void back(BuildContext ctx) {
    setState(() {
      if (selectedQuestionIndex > -1) {
        score = [selectedQuestionIndex]['answer']
        selectedQuestionIndex--;

      }
      if (selectedQuestionIndex < 0)
        Navigator.of(ctx).pushReplacementNamed('home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Q${selectedQuestionIndex + 1}'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/math.jpeg'),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.85),
                child: Text(
                  mathQA[selectedQuestionIndex]['question'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ...(mathQA[selectedQuestionIndex]['answer'] as List).map((e) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 150, vertical: 10))),
                    onPressed: () => selected(e['sc'], context),
                    child: Text(
                      e['ans'].toString(),
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
        floatingActionButton: selectedQuestionIndex == 0
            ? FloatingActionButton(
                onPressed: () => back(context),
                child: Icon(Icons.arrow_back),
                backgroundColor: Colors.blueGrey,
              )
            : FloatingActionButton(
                onPressed: () => back(context),
                child: Icon(Icons.restart_alt_outlined),
                backgroundColor: Colors.blueGrey,
              ));
  }
}
