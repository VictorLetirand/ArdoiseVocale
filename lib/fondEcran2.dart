import 'package:ardoise_vocale/myHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioGroup = 0;
  static Color couleurFond = Colors.white;

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
      switch (radioGroup) {
        case 0:
          couleurFond = Colors.grey[100];
          break;
        case 1:
          couleurFond = Colors.white;
          break;
        case 2:
          couleurFond = Colors.teal[100];
          break;
        case 3:
          couleurFond = Colors.pink[100];
          break;
      }
    });
  }

  void retour(BuildContext context) {
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: new Text("Fond d'écran"),
        leading: IconButton(
            icon: Icon(Icons.west), onPressed: () => {Navigator.pop(context)}),
      ),
      backgroundColor: couleurFond,
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(12.0),
            ),
            new Column(
              children: <Widget>[
                new RadioListTile<int>(
                  value: 0,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Gris'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 1,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Blanc'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 2,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Vert'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 3,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Rose'),
                  activeColor: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
