import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

// https://www.geeksforgeeks.org/flutter-load-json-assets/?ref=ml_lbp
// https://stackoverflow.com/questions/71382868/how-to-parse-nested-json-in-flutter
class ReadJsonFive extends StatefulWidget {
  const ReadJsonFive({super.key});

  @override
  State<ReadJsonFive> createState() => _ReadJsonFiveState();
}

class _ReadJsonFiveState extends State<ReadJsonFive> {
  var jsonData;

  void displayJSONData() async {
    String response =  await rootBundle.loadString('assets/sample_json_five.json');

    Map<String, dynamic> jsonDataPrint = jsonDecode(response);

    print('-------------> Name: ${jsonDataPrint['name']}');
    print('-------------> Age: ${jsonDataPrint['age']}');
    print('-------------> isStudent: ${jsonDataPrint['isStudent']}');
    print('-------------> grades: ${jsonDataPrint['grades']}');
    print('-------------> grades: ${jsonDataPrint['grades'][0]}');
    print('-------------> grades: ${jsonDataPrint['grades'][1]}');
    print('-------------> grades: ${jsonDataPrint['grades'][2]}');

    setState(() {
      jsonData = jsonDecode(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read JSON Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: displayJSONData,
            ),
            jsonData != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(jsonData['name']),
                        Text(jsonData['age'].toString()),
                        Text(jsonData['isStudent'].toString()),
                        Text(jsonData['grades'][0].toString()),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
