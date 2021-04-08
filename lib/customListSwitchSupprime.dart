import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class CustomListSwitchSupprime extends StatelessWidget {
  IconData icon;
  String text;
  IconData iconOn;
  static bool suppression = false;
  static int suppressionCode = 0;

  Future<bool> saveSwitchPreferences(int suppression) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('suppression', suppressionCode);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  static Future<int> getSwitchPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int suppression = prefs.getInt('suppression');
    return suppression;
  }

  saveSwitchValue() async {
    int suppression = suppressionCode;
    saveSwitchPreferences(suppression).then((bool comitted) {
      print("switch effectu");
    });
  }

  CustomListSwitchSupprime(this.icon, this.text, this.iconOn);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 0.8, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.blueAccent,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 5.0, 0.8, 5.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    LiteRollingSwitch(
                      value: suppression,
                      textOn: "On",
                      textOff: "Off",
                      colorOn: Colors.greenAccent,
                      colorOff: Colors.redAccent,
                      iconOn: iconOn,
                      iconOff: Icons.block,
                      textSize: 18.0,
                      onChanged: (bool position) {
                        if (position) {
                          suppression = true;
                          suppressionCode = 1;
                          saveSwitchValue();
                          print("ok");
                        } else {
                          suppression = false;
                          suppressionCode = 0;
                          saveSwitchValue();
                          print("no");
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
