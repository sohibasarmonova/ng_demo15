import 'package:flutter/material.dart';
import 'package:ng_demo15/pages/broadcast_stream_page.dart';
import 'package:ng_demo15/pages/home_page.dart';
import 'package:ng_demo15/pages/single_strem_page.dart';
import 'package:ng_demo15/pages/stream_builder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:StreamBuilderPage(),
    );
  }
}


