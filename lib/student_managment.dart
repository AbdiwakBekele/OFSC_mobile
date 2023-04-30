import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ofcsis/constant.dart';

class StudentManagment extends StatefulWidget {
  const StudentManagment({Key? key}) : super(key: key);

  @override
  State<StudentManagment> createState() => _StudentManagmentState();
}

class _StudentManagmentState extends State<StudentManagment> {
  String create_api_url = "http://192.168.1.16/projects/flutter_api/detail.php";
  String idInput = "";
  bool isValidated = true;

  String full_name = "";
  String mother_name = "";
  String address = "";
  String phone = "";
  String age = "";
  String maths = "";
  String english = "";
  String biology = "";
  String chemistry = "";
  String physics = "";
  String discipline = "";
  String health = "";

  bool doneLoaded = false;
  bool isClicked = false;

  Future _createStudent() async {
    var url = Uri.parse(create_api_url);

    try {
      http.Response response = await http.post(url, body: {
        'id': idInput,
      });
      var data = jsonDecode(response.body);
      print(response.statusCode);

      if (response.statusCode == 200 && data['full_name'] != null) {
        full_name = data['full_name'];
        mother_name = data['mother_name'];
        address = data['address'];
        phone = data['phone'];
        age = data['age'];
        maths = data['maths'];
        english = data['english'];
        biology = data['biology'];
        chemistry = data['chemistry'];
        physics = data['physics'];
        discipline = data['discipline'];
        health = data['health'];

        setState(() {
          doneLoaded = true;
        });
      } else {
        setState(() {
          doneLoaded = false;
        });
      }
    } catch (e) {
      print(e.toString());

      setState(() {
        doneLoaded = false;
      });

      final scaffold = ScaffoldMessenger.of(context);
      return scaffold.showSnackBar(
        SnackBar(
          content: const Text('Unable to Get the data. Please Try Again....'),
        ),
      );
    }
  }

  Widget tableText(String data) {
    if (data.isEmpty) {
      data = '-';
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  //Data Widget
  Widget decideWidget() {
    return (!doneLoaded)
        ? SizedBox()
        : Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                // Table Data
                Table(
                  children: [
                    // ID Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [tableText("Student ID"), tableText(idInput)],
                    ),

                    // Full Name Row
                    TableRow(
                      children: [tableText("Full Name"), tableText(full_name)],
                    ),

                    // Mother Name Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [
                        tableText("Mother Name"),
                        tableText(mother_name)
                      ],
                    ),

                    // Address Row
                    TableRow(
                      children: [tableText("Address"), tableText(address)],
                    ),

                    //Phone Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [tableText("Phone Number"), tableText(phone)],
                    ),

                    //Age Row
                    TableRow(
                      children: [tableText("Age"), tableText(age)],
                    ),

                    //maths Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [tableText("Mathematics"), tableText(maths)],
                    ),

                    //English Row
                    TableRow(
                      children: [tableText("English"), tableText(english)],
                    ),

                    //Biology Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [tableText("Biology"), tableText(biology)],
                    ),

                    //Chemistry Row
                    TableRow(
                      children: [tableText("Chemistry"), tableText(chemistry)],
                    ),

                    //physics Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [tableText("Physics"), tableText(physics)],
                    ),

                    //Discipline Row
                    TableRow(
                      children: [
                        tableText("Discipline"),
                        tableText(discipline)
                      ],
                    ),

                    //Health Row
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      children: [tableText("Health Status"), tableText(health)],
                    ),
                  ],
                ),
                // Divider
                Divider(height: 30, color: Colors.grey),
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Information"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Input Field
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 30,
                    margin: const EdgeInsets.all(15),
                    child: TextField(
                      onChanged: (value) {
                        idInput = value;
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(hintText: "Input Student ID Here"),
                    ),
                  ),
                ],
              ),
              (isValidated)
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
              SizedBox(height: 20),
              // Search Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      if (idInput.isNotEmpty) {
                        isClicked = true;
                        await _createStudent();
                        setState(() {
                          isValidated = true;
                        });
                      } else {
                        setState(() {
                          isValidated = false;
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Text("Submit!"),
                      ],
                    ),
                    style: kStyle(context, Theme.of(context).primaryColor)),
              ),
              // Data Widget
              decideWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
