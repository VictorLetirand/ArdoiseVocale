import 'package:ardoise_vocale/couleurBulles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'couleurFond.dart';

class CouleurBulle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CouleurBulleState();
  }
}

class CouleurBulleState extends State<CouleurBulle> {
  int radioGroup = 0;
  static Color couleurBulleSend = CouleurFond.backColor;
  static Color couleurBulleReceive = CouleurFond.backColor;

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
      switch (radioGroup) {
        case 0:
          CouleurBulles.bulleSend = Colors.grey[100];
          CouleurBulles.bulleReceive = Colors.grey[100];
          break;
        case 1:
          CouleurBulles.bulleSend = Colors.white;
          CouleurBulles.bulleReceive = Colors.white;
          break;
        case 2:
          CouleurBulles.bulleSend = Colors.teal[100];
          CouleurBulles.bulleReceive = Colors.teal[100];
          break;
        case 3:
          CouleurBulles.bulleSend = Colors.pink[100];
          CouleurBulles.bulleReceive = Colors.pink[100];
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
        title: new Text("Couleur des bulles"),
        leading: IconButton(
            icon: Icon(Icons.west), onPressed: () => {Navigator.pop(context)}),
      ),
      backgroundColor: CouleurFond.backColor,
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
