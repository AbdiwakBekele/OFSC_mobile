import 'package:flutter/material.dart';
import 'package:ofcsis/constant.dart';
import 'package:ofcsis/login.dart';
import 'package:ofcsis/student_managment.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                "Online Family Centric Student Information System for Jimma Community School"
                    .toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.blue)),
          ),
          Image.asset(
            "assets/images/jucs.jpg",
            height: MediaQuery.of(context).size.height * 0.7,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Login();
                },
              ));
            },
            child: Text("Get Started"),
            style: kStyle(context, Theme.of(context).primaryColor),
          ),
        ]),
      ),
    );
  }
}
