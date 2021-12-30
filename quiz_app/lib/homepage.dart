// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:quiz_app/result.dart';
import 'questions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;
  var score = 0;
  List<Questions> qList = [
    Questions("1. The Human Body has Four Lungs ", false),
    Questions("2. There are 12 months in a year ", true),
    Questions("3. The Human Body has two Ears ", true),
    Questions("4. The Human Body has Four legs ", false),
    Questions("5. The Human Body has one heart ", true),
    Questions("6. Nepal has 75 districts ", false),
    Questions("7. Tokyo is the Capital of Japan ", true),
    Questions("8. World has 7 continents ", true),
    Questions("9. National bird of Nepal is Dove ", false),
    Questions(
        "10. Scientific name of \'Kande Vyaakur\' is Spiny Babler ", true),
  ];

  checkWin(bool userChoice) {
    if (userChoice == qList[counter].isCorrect) {
      // ignore: avoid_print
      print("correct");
      if (counter < qList.length - 1) {
        score += 10;
      } else {}
      const snackbar = SnackBar(
        duration: Duration(milliseconds: 250),
        backgroundColor: Colors.green,
        content: Text(
          "Correct !!",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      // ignore: avoid_print
      print("incorrect");
      const snackbar = SnackBar(
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.red,
        content: Text(
          "Incorrect !!",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (counter < qList.length - 1) {
        counter++;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QUIZ APP"),
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: Colors.amberAccent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://thumbs.dreamstime.com/z/ready-quiz-written-notebook-marker-pen-glasses-wooden-desk-business-concept-ready-quiz-118902066.jpg"),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 300,
              padding: const EdgeInsets.all(4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Score =  $score / ${qList.length * 10}",
                    style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: reset,
                    child: const Text(
                      "RESET",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              height: 80,
              child: Center(
                child: Text(
                  qList[counter].qText,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigoAccent[400],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.green,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkWin(true);
                      if (counter == qList.length - 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Completed"),
                            duration: Duration(milliseconds: 200),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              qlist: qList,
                              totalScore: score,
                            ),
                          ),
                        );
                      } else {}
                    },
                    child: const Text(
                      "TRUE",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                    onPressed: () {
                      checkWin(false);
                      if (counter == qList.length - 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Completed"),
                            duration: Duration(milliseconds: 200),
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              qlist: qList,
                              totalScore: score,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "FALSE",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
