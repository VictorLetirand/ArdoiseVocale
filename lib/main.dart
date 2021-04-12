import 'package:ardoise_vocale/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(scaffoldBackgroundColor: Colors.white),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new SplashScreen(
        title: new Text(
          "L' ARDOISE VOCALE",
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            fontFamily: 'RaleWay',
          ),
        ),
        seconds: 6,
        navigateAfterSeconds: MyHomePage(),
        image: new Image.asset(
          'images/logo-splash.gif',
        ),
        backgroundColor: Colors.grey[350],
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        loaderColor: Colors.grey[350],
      ),
    );
  }
}
