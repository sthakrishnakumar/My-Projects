import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/questions.dart';

class ResultPage extends StatelessWidget {
  ResultPage({Key? key, required this.qlist, required this.totalScore})
      : super(key: key);
  List<Questions> qlist;
  int totalScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      // ignore: avoid_unnecessary_containers
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Your Score is  $totalScore "),
              const SizedBox(
                height: 8,
              ),
              Text("  Correct Answer = ${totalScore / 10}"),
              const SizedBox(
                height: 8,
              ),
              Text("  Wrong Answer = ${qlist.length - totalScore / 10}")
            ],
          ),
        ),
      ),
    );
  }
}
