import 'package:ardoise_vocale/customListSwitchPonctuation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customListSwitchSupprime.dart';
import 'customListTile.dart';
import 'modeEmploi.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blue[900],
                  Colors.blue[300],
                ],
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'images/logo-transparent.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Paramètre',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomListTile(
              Icons.file_copy_sharp,
              "Mode d'emploi",
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ModeEmploi()))
                  }),
          CustomListTile(
              Icons.picture_in_picture_sharp, "Fond d'écran", () => {}),
          CustomListTile(Icons.color_lens_rounded,
              'Changer couleur du texte vocal', () => {}),
          CustomListTile(Icons.color_lens_rounded,
              'Changer couleur du texte écrit', () => {}),
          CustomListSwitchSupprime(
              Icons.delete, 'Effacer en touchant', Icons.delete),
          CustomListSwitchPonctuation(Icons.priority_high_sharp, 'Ponctuation',
              Icons.priority_high_sharp),
          CustomListTile(Icons.mail, 'Envoi par Mail', () => {}),
          CustomListTile(
              Icons.settings_outlined, 'Paramètres par défaut', () => {})
        ],
      ),
    );
  }
}
