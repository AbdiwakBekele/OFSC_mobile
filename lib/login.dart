import 'package:flutter/material.dart';
import 'package:ofcsis/homepage.dart';
import 'package:ofcsis/student_managment.dart';

import 'constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isValidate = true;
  String loginUserInput = "";
  String loginPasswordInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login".toUpperCase(),
                style: TextStyle(fontSize: 25),
              ),
              // Username Input
              TextField(
                onChanged: (value) {
                  loginUserInput = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: "Input username"),
              ),
              // Password Input
              TextField(
                onChanged: (value) {
                  loginPasswordInput = value;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(hintText: "Input Password"),
              ),

              // validation Status
              (isValidate)
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red, size: 17),
                          SizedBox(width: 10),
                          Text(
                            "Input required!",
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          )
                        ],
                      ),
                    ),

              //Login Button
              ElevatedButton(
                onPressed: () {
                  if (loginUserInput == "admin" &&
                      loginPasswordInput == "admin") {
                    isValidate = true;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return StudentManagment();
                      },
                    ));
                  } else if (loginUserInput.isEmpty ||
                      loginPasswordInput.isEmpty) {
                    setState(() {
                      isValidate = false;
                    });
                  } else {
                    setState(() {
                      isValidate = true;
                    });

                    final scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(
                      SnackBar(
                        content: const Text(
                            'Incorrect Password. Please Try Again....'),
                      ),
                    );
                  }
                },
                child: Text("Login"),
                style: kStyle(context, Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
