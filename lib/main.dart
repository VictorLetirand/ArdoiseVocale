import 'package:ardoise_vocale/myHomePage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ardoise Vocale',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
*/
void main() {
  runApp(new MaterialApp(
    //debugShowCheckedModeBanner: false,
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
      //onClick: () => Navigator.push(
      //   context, MaterialPageRoute(builder: (context) => MyHomePage())),
      loaderColor: Colors.grey[350],
    );
  }
}
