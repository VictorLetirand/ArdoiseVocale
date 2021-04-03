import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'couleurFond.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioGroup = 0;
  static Color couleurFond = CouleurFond.backColor;

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
      switch (radioGroup) {
        case 0:
          CouleurFond.backColor = Colors.grey[100];
          couleurFond = CouleurFond.backColor;
          break;
        case 1:
          CouleurFond.backColor = Colors.white;
          couleurFond = CouleurFond.backColor;
          break;
        case 2:
          CouleurFond.backColor = Colors.teal[100];
          couleurFond = CouleurFond.backColor;
          break;
        case 3:
          CouleurFond.backColor = Colors.pink[100];
          couleurFond = CouleurFond.backColor;
          break;
        case 4:
          CouleurFond.backColor = Color.fromRGBO(44, 62, 80, 1);
          couleurFond = CouleurFond.backColor;
          break;
        case 5:
          CouleurFond.backColor = Color.fromRGBO(108, 92, 231, 1);
          couleurFond = CouleurFond.backColor;
          break;
        case 6:
          CouleurFond.backColor = Color.fromRGBO(255, 234, 167, 1);
          couleurFond = CouleurFond.backColor;
          break;
        case 7:
          CouleurFond.backColor = Color.fromRGBO(61, 61, 61, 1);
          couleurFond = CouleurFond.backColor;
          break;
        case 8:
          CouleurFond.backColor = Color.fromRGBO(24, 220, 255, 1);
          couleurFond = CouleurFond.backColor;
          break;
        case 9:
          CouleurFond.backColor = Color.fromRGBO(204, 174, 98, 1);
          couleurFond = CouleurFond.backColor;
          break;
        case 10:
          CouleurFond.backColor = Color.fromRGBO(255, 121, 63, 1);
          couleurFond = CouleurFond.backColor;
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
        backgroundColor: Color.fromRGBO(44, 62, 80, 1),
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
                ),
                new RadioListTile<int>(
                  value: 4,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Sombre'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 5,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Violet'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 6,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Jaune pâle'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 7,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Gris Foncé'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 8,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Bleu Ciel'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 9,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Sable'),
                  activeColor: Colors.black,
                ),
                new RadioListTile<int>(
                  value: 10,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Citrouille'),
                  activeColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
