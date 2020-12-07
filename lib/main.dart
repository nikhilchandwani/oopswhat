import 'package:flutter/material.dart';
import 'package:oopswhat/views/signup.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        primarySwatch: Colors.blue,
        fontFamily: "OverpassRegular",
      ),
      home: SignUp(),
    );
  }
}
