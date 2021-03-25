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
    return new SplashScreen(
      title: new Text(
        'ARDOISE VOCALE',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
      ),
      seconds: 6,
      navigateAfterSeconds: MyHomePage(),
      image: new Image.asset(
        'images/logo-splash.gif',
      ),
      backgroundColor: Colors.grey[350],
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 200.0,
      onClick: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage())),
      loaderColor: Colors.grey[350],
    );
  }
}
