import 'dart:async';

import 'package:flutter/material.dart';

class SingleStreamPage extends StatefulWidget {
  const SingleStreamPage({super.key});

  @override
  State<SingleStreamPage> createState() => _SingleStreamPageState();
}

class _SingleStreamPageState extends State<SingleStreamPage> {
  final StreamController<String> singleController = StreamController();
  String singleStream = "No data";

  @override
  void initState() {
    super.initState();
    addStreamData();
  }

  addStreamData() async{
    singleController.stream.listen((data) {
      setState(() {
        singleStream = data;
      });
    });

    /// Add events to the StreamController with a 1-second delay.
    await addDelayedData('Hello');
    await addDelayedData('World');
    await addDelayedData('How');
    await addDelayedData('Are');
    await addDelayedData('You!!');
  }

  Future<void> addDelayedData(String data) async{
    await Future.delayed(const Duration(seconds: 1));
    singleController.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Single Stream Page"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              singleStream,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}