import 'dart:io';
import 'package:ardoise_vocale/assets/ardoiseIcons.dart';
import 'package:ardoise_vocale/couleurBulle.dart';
import 'package:ardoise_vocale/couleurBulles.dart';
import 'package:ardoise_vocale/couleurFond.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fondEcran.dart';
import 'myDrawer.dart';
import 'post.dart';
import 'police.dart';
import 'textImputWidget.dart';
import 'postList.dart';
//CHANGE
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  //TENTATIVE RECO VOCALE 100% BONNE
  stt.SpeechToText _speech;
  bool _isListening = false;
  int firstLaunch = 1;
  static bool needsScroll = false;
  static bool changeOnScreen = false;

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              print('bonjour');
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  List<Post> posts = [];
  String text = '';
  //Change
  static List<String> textFinal = [];

  Future<bool> saveLaunchPreferences(int isFirstLaunched) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('firstLaunch', firstLaunch);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<int> getLaunchPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int first = prefs.getInt('firstLaunch');
    return first;
  }

  saveValueLaunch() async {
    int first = firstLaunch;
    saveLaunchPreferences(first).then((bool comitted) {});
  }

  static Future<bool> savePolicePreferences(double police) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('police', Police.taillePolice);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  static Future<double> getPolicePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double police = prefs.getDouble('police');
    return police;
  }

  static saveValue() async {
    double police = Police.taillePolice;
    savePolicePreferences(police).then((bool comitted) {});
  }

  @override
  void initState() {
    getLaunchPreferences().then(updateLaunch);
    /*
    if (MyHomePageState.firstLaunch == 1) {}
    MyHomePageState.firstLaunch = 0;
    saveValueLaunch();*/

    //print(firstLaunch);
    HomeState.getBackgroundPreferences().then(updateBackgroundColor);
    //CustomListSwitchSupprime.getSwitchPreferences().then(updateSwitch);

    super.initState();
    _speech = stt.SpeechToText();
  }

  void updateLaunch(int firstAled) {
    setState(() {
      if (firstAled == null) {
        firstLaunch = 1;
        firstAled = 0;
        print(firstLaunch);
        Police.taillePolice = 15.0;
        saveValue();
        CouleurFond.backCodeColor = 1;
        CouleurFond.backColor = Colors.white;
        HomeState.saveValueBackCode();
        CouleurBulles.bullesCodeColor = 0;
        CouleurBulles.bulleSend = Colors.blue;
        CouleurBulles.bulleReceive = Color(0xffE7E7ED);
        CouleurBulleState.saveValueBullesCode();
        firstLaunch = 0;
      } else {
        firstLaunch = 0;
      }
    });
  }

  void updateBackgroundColor(int backCodeColor) {
    setState(() {
      if (backCodeColor == 0) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Colors.grey[100];
      } else if (backCodeColor == 1) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Colors.white;
      } else if (backCodeColor == 2) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Colors.teal[100];
      } else if (backCodeColor == 3) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Colors.pink[100];
      } else if (backCodeColor == 4) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(44, 62, 80, 1);
      } else if (backCodeColor == 5) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(108, 92, 231, 1);
      } else if (backCodeColor == 6) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(255, 234, 167, 1);
      } else if (backCodeColor == 7) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(61, 61, 61, 1);
      } else if (backCodeColor == 8) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(24, 220, 255, 1);
      } else if (backCodeColor == 9) {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(204, 174, 98, 1);
      } else {
        CouleurFond.backCodeColor = backCodeColor;
        CouleurFond.backColor = Color.fromRGBO(255, 121, 63, 1);
      }
    });
  }

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "ecris"));
      //CHANGE
      textFinal.add("(écrit) " + text);
    });
  }

  void newPostVoc(String text) {
    this.setState(() {
      posts.add(new Post(text, "Vocal"));
      //CHANGE
      textFinal.add("(Vocal) " + text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AV"),
        backgroundColor: Color.fromRGBO(44, 62, 80, 1),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    firstLaunch = 0;
                    saveValueLaunch();
                    Fluttertoast.showToast(
                        msg: "Mise à jour de vos paramètres");
                  });
                },
                child: Icon(
                  Icons.refresh,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Police.taillePolice += 3;
                    firstLaunch = 0;
                    saveValue();
                    saveValueLaunch();
                  });
                },
                child: Icon(
                  Icons.add,
                  size: 28.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Police.taillePolice -= 3;
                    firstLaunch = 0;
                    saveValue();
                    saveValueLaunch();
                  });
                },
                child: Icon(Icons.horizontal_rule, size: 28.0),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    posts.clear();
                    textFinal.clear();
                    MyDrawer.finalText = "";
                    firstLaunch = 0;
                    saveValueLaunch();
                  });
                },
                child: Icon(Icons.delete),
              )),
        ],
      ),
      backgroundColor: CouleurFond.backColor,
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.posts)),
          SingleChildScrollView(
              reverse: true,
              padding: const EdgeInsets.all(20).copyWith(bottom: 10),
              child: Text(text,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "bouton Exit",
                child: Icon(Icons.exit_to_app, size: 30),
                mini: true,
                backgroundColor: Colors.red,
                onPressed: () {
                  exit(0);
                },
              ),
              Row(
                children: [
                  FloatingActionButton(
                      heroTag: "bouton annuler",
                      child: Icon(ArdoiseIcons.rubber),
                      mini: true,
                      backgroundColor: Colors.orange,
                      onPressed: () {
                        setState(() {
                          text = '';
                          _isListening = false;
                        });
                      }),
                  FloatingActionButton(
                    heroTag: "bouton parler",
                    child: Icon(_isListening ? Icons.mic : Icons.mic_none,
                        size: 36),
                    onPressed: _listen,
                  ),
                  FloatingActionButton(
                      heroTag: "bouton Valider",
                      child: Icon(Icons.check),
                      mini: true,
                      backgroundColor: Colors.green,
                      onPressed: () {
                        if (text != "") {
                          newPostVoc(text);
                          setState(() {
                            text = '';
                            needsScroll = true;
                            _isListening = false;
                          });
                        }
                      }),
                ],
              ),
              FloatingActionButton(
                heroTag: "bouton ?",
                child: Icon(Icons.help, size: 30),
                mini: true,
                onPressed: () {
                  setState(() {
                    text += ' ?';
                  });
                },
              ),
            ],
          ),
          TextInputWidget(this.newPost),
        ],
      ),
    );
  }
  /*
  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => this.text = text,
      onListening: (isListening) {
        setState(() => this.isListening = isListening);
      });
      */
}
