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
          CouleurBulles.bulleSend = Colors.blue;
          CouleurBulles.bulleReceive = Colors.blue;
          break;
        case 1:
          CouleurBulles.bulleSend = Colors.green;
          CouleurBulles.bulleReceive = Colors.red;
          break;
        case 2:
          CouleurBulles.bulleSend = Colors.green;
          CouleurBulles.bulleReceive = Colors.grey[100];
          break;
        case 3:
          CouleurBulles.bulleSend = Colors.pink[100];
          CouleurBulles.bulleReceive = Colors.purple[200];
          break;
        case 4:
          CouleurBulles.bulleSend = Color.fromRGBO(48, 51, 107, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(104, 109, 224, 1);
          break;
        case 5:
          CouleurBulles.bulleSend = Color.fromRGBO(34, 166, 179, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(126, 214, 223, 1);
          break;
        case 6:
          CouleurBulles.bulleSend = Color.fromRGBO(249, 202, 36, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(246, 229, 141, 1);
          break;
        case 7:
          CouleurBulles.bulleSend = Color.fromRGBO(48, 57, 82, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(89, 98, 117, 1);
          break;
        case 8:
          CouleurBulles.bulleSend = Color.fromRGBO(234, 32, 39, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(238, 90, 36, 1);
          break;
        case 9:
          CouleurBulles.bulleSend = Color.fromRGBO(18, 137, 167, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(18, 203, 196, 1);
          break;
        case 10:
          CouleurBulles.bulleSend = Color.fromRGBO(192, 57, 43, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(241, 196, 15, 1);
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
                  title: new Text('Gris / Bleu'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 1,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Vert / Rouge'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 2,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Vert / Gris'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 3,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Rose / Violet'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 4,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Bleu-Violet / Bleu-Gris'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 5,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Bleu Turquoise / Bleu Ciel'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 6,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Jaune poussin / Jaune pâle'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 7,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Gris Foncé / Gris'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 8,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Rouge / Orange'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 9,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Bleu Gris / Vert Marin'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 10,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Rouge / Jaune'),
                  activeColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
