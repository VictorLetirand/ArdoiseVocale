import 'package:ardoise_vocale/couleurBulles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'couleurFond.dart';

class CouleurBulle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CouleurBulleState();
  }
}

class CouleurBulleState extends State<CouleurBulle> {
  int radioGroup = 0;

  static Future<bool> saveBullesPreferences(int bulles) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('bulles', CouleurBulles.bullesCodeColor);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  static Future<int> getBullesPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int bulles = prefs.getInt('bulles');
    return bulles;
  }

  static saveValueBullesCode() async {
    int code = CouleurBulles.bullesCodeColor;
    saveBullesPreferences(code).then((bool comitted) {});
  }

  void radioEventHandler(int value) {
    setState(() {
      radioGroup = value;
      switch (radioGroup) {
        case 0:
          CouleurBulles.bulleSend = Colors.blue;
          CouleurBulles.bulleReceive = Color(0xffE7E7ED);
          CouleurBulles.bullesCodeColor = 0;
          saveValueBullesCode();
          break;
        case 1:
          CouleurBulles.bulleSend = Colors.green;
          CouleurBulles.bulleReceive = Colors.red;
          CouleurBulles.bullesCodeColor = 1;
          saveValueBullesCode();
          break;
        case 2:
          CouleurBulles.bulleSend = Colors.green;
          CouleurBulles.bulleReceive = Colors.grey[100];
          CouleurBulles.bullesCodeColor = 2;
          saveValueBullesCode();
          break;
        case 3:
          CouleurBulles.bulleSend = Colors.pink[100];
          CouleurBulles.bulleReceive = Colors.purple[200];
          CouleurBulles.bullesCodeColor = 3;
          saveValueBullesCode();
          break;
        case 4:
          CouleurBulles.bulleSend = Color.fromRGBO(48, 51, 107, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(104, 109, 224, 1);
          CouleurBulles.bullesCodeColor = 4;
          saveValueBullesCode();
          break;
        case 5:
          CouleurBulles.bulleSend = Color.fromRGBO(34, 166, 179, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(126, 214, 223, 1);
          CouleurBulles.bullesCodeColor = 5;
          saveValueBullesCode();
          break;
        case 6:
          CouleurBulles.bulleSend = Color.fromRGBO(249, 202, 36, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(246, 229, 141, 1);
          CouleurBulles.bullesCodeColor = 6;
          saveValueBullesCode();
          break;
        case 7:
          CouleurBulles.bulleSend = Color.fromRGBO(48, 57, 82, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(89, 98, 117, 1);
          CouleurBulles.bullesCodeColor = 7;
          saveValueBullesCode();
          break;
        case 8:
          CouleurBulles.bulleSend = Color.fromRGBO(234, 32, 39, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(238, 90, 36, 1);
          CouleurBulles.bullesCodeColor = 8;
          saveValueBullesCode();
          break;
        case 9:
          CouleurBulles.bulleSend = Color.fromRGBO(18, 137, 167, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(18, 203, 196, 1);
          CouleurBulles.bullesCodeColor = 9;
          saveValueBullesCode();
          break;
        case 10:
          CouleurBulles.bulleSend = Color.fromRGBO(192, 57, 43, 1);
          CouleurBulles.bulleReceive = Color.fromRGBO(241, 196, 15, 1);
          CouleurBulles.bullesCodeColor = 10;
          saveValueBullesCode();
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
                  title: new Text('Rouge / Vert'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 2,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Gris / Vert'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 3,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Violet / Rose'),
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
                  title: new Text('Jaune pâle / Jaune poussin'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 7,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Gris  / Gris Foncé'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 8,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Orange / Rouge'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 9,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Vert Marin / Bleu Gris'),
                  activeColor: Colors.red,
                ),
                new RadioListTile<int>(
                  value: 10,
                  groupValue: radioGroup,
                  onChanged: radioEventHandler,
                  title: new Text('Jaune / Rouge'),
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
