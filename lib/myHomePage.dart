import 'dart:io';

import 'package:ardoise_vocale/couleurFond.dart';
import 'package:ardoise_vocale/customListSwitchSupprime.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fondEcran.dart';
import 'myDrawer.dart';
import 'post.dart';
import 'police.dart';
import 'textImputWidget.dart';
import 'postList.dart';
import 'substring_highlighted.dart';
import 'speech_api.dart';
import 'utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  String text = '';
  //Change
  static List<String> textFinal = [];
  bool isListening = false;
  static Color couleurF = CouleurFond.backColor;

  Future<bool> savePolicePreferences(double police) async {
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

  saveValue() async {
    double police = Police.taillePolice;
    savePolicePreferences(police).then((bool comitted) {
      print("police sauvegardée");
    });
  }

  @override
  void initState() {
    HomeState.getBackgroundPreferences().then(updateBackgroundColor);
    CustomListSwitchSupprime.getSwitchPreferences().then(updateSwitch);
    print(CouleurFond.backCodeColor);
    super.initState();
  }

  void updateSwitch(int switchChange) {
    setState(() {
      switch (switchChange) {
        case 0:
          CustomListSwitchSupprime.suppressionCode = switchChange;
          CustomListSwitchSupprime.suppression = false;
          break;
        case 1:
          CustomListSwitchSupprime.suppressionCode = switchChange;
          CustomListSwitchSupprime.suppression = true;
          break;
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
        title: Text("Ardoise Vocale"),
        backgroundColor: Color.fromRGBO(44, 62, 80, 1),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    print("");
                    Fluttertoast.showToast(
                        msg: "Mise à jour de vos paramètres");
                  });
                },
                child: Icon(
                  Icons.refresh,
                  size: 22.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Police.taillePolice += 3;
                    print(Police.taillePolice);
                    saveValue();
                  });
                },
                child: Icon(
                  Icons.zoom_in,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Police.taillePolice -= 3;
                    print(Police.taillePolice);
                    saveValue();
                  });
                },
                child: Icon(Icons.zoom_out),
              )),
          Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    posts.clear();
                    textFinal.clear();
                    MyDrawer.finalText = "";
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
            padding: const EdgeInsets.all(30).copyWith(bottom: 75),
            child: SubstringHighlight(
              text: text,
              terms: Command.all,
              textStyle: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              textStyleHighlight: TextStyle(
                fontSize: 32.0,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
                      child: Icon(Icons.edit_off),
                      mini: true,
                      backgroundColor: Colors.orange,
                      onPressed: () {
                        setState(() {
                          text = '';
                        });
                      }),
                  FloatingActionButton(
                    heroTag: "bouton parler",
                    child: Icon(isListening ? Icons.mic : Icons.mic_none,
                        size: 36),
                    onPressed: toggleRecording,
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

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => this.text = text,
      onListening: (isListening) {
        setState(() => this.isListening = isListening);
      });
}
