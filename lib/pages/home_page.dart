import 'dart:isolate';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Isolate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/gifs/ball.gif'),
            //Blocking UI task
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                var total = await complexTask1();
                print('Result 1: $total');
              },
              child: Text("Task 1"),
            ),

            //Isolate
            MaterialButton(
              color: Colors.blue,
              onPressed: () async{
                final receivePort = ReceivePort();
                await Isolate.spawn(complexTask2, receivePort.sendPort);
                receivePort.listen((total) {
                  print('Result 2: $total');
                });
              },
              child: Text("Task 2"),
            ),
          ],
        ),
      ),
    );
  }

  Future<double> complexTask1() async {
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }
    return total;
  }
}
//--End of HomePage--

complexTask2(SendPort sendPort){
  var total = 0.0;
  for (var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}