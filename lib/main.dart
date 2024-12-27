import 'package:clipper_textformfield_showdialogs_f18assignment/backgroudImage.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/customContainer.dart';
import 'package:clipper_textformfield_showdialogs_f18assignment/title.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var src =
      "https://images.unsplash.com/photo-1647647699992-4f7489c236ca?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzF8fHNvbmdzfGVufDB8fDB8fHww";

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              backgroundImage(src: src, context: context),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mqSize.height * 0.05,
                  ),
                  myTitle(context: context),
                  const CustomContainer()
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
