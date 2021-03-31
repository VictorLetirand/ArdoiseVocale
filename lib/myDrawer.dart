import 'dart:io';

import 'package:ardoise_vocale/couleurBulle.dart';
import 'package:ardoise_vocale/customListSwitchPonctuation.dart';
import 'package:ardoise_vocale/fondEcran.dart';
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
              Icons.picture_in_picture_sharp,
              "Fond d'écran",
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()))
                  }),
          CustomListTile(
              Icons.color_lens_rounded,
              'Changer couleur des bulles',
              () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CouleurBulle()))
                  }),
          CustomListSwitchSupprime(
              Icons.delete, 'Effacer une bulle', Icons.delete),
          CustomListSwitchPonctuation(Icons.priority_high_sharp,
              'Ponctuation vocale', Icons.priority_high_sharp),
          CustomListTile(
              Icons.mail,
              'Envoi par Mail',
              () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0)), //this right here
                            child: Container(
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Envoi de la discussion en texte :'),
                                    ),
                                    TextField(
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          hintText:
                                              "Entrez le mail du destinataire"),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: RaisedButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Envoyer",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: const Color(0xFF1BC0C5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  }),
          CustomListTile(Icons.settings_outlined, 'Réinitialisation', () => {}),
          CustomListTile(Icons.exit_to_app_rounded, "Quitter l'application",
              () => {exit(0)}),
        ],
      ),
    );
  }
}
