import 'dart:io';
import 'package:ardoise_vocale/couleurBulle.dart';
import 'package:ardoise_vocale/fondEcran.dart';
import 'package:ardoise_vocale/myHomePage.dart';
import 'package:ardoise_vocale/substring_highlighted.dart';
import 'package:ardoise_vocale/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'customListSwitchSupprime.dart';
import 'customListTile.dart';
import 'couleurFond.dart';
import 'couleurBulles.dart';
import 'police.dart';
import 'modeEmploi.dart';
//CHANGE
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:avatar_glow/avatar_glow.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  String mailDestinataire = "";
  //CHANGE
  final pdf = pw.Document();
  static String finalText = "";

  remplirText(List<String> textFinal) {
    finalText = "";
    for (int i = 0; i < textFinal.length; i++) {
      finalText += "\n" + "\n" + textFinal[i];
    }
  }

  //CHANGE
  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              level: 0,
              child: pw.Text("Texte Ardoise Vocale",
                  style: pw.TextStyle(fontSize: 50)),
            ),
            pw.Paragraph(
              text: finalText,
              style: pw.TextStyle(fontSize: 30),
            ),
          ];
        }));
  }

  //CHANGE
  Future savePDF() async {
    Directory documentDirectory = await getExternalStorageDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/ardoise.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 170.0,
            child: DrawerHeader(
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(44, 62, 80, 1),
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    AvatarGlow(
                      endRadius: 60.0,
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Image.asset(
                            'images/logo-transparent.png',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Paramètres',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
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
          Container(
            height: 60,
            child: CustomListSwitchSupprime(
                Icons.delete, 'Effacer une bulle', Icons.delete),
          ),
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
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SubstringHighlight(
                                          text:
                                              "Envoi de la discussion en texte",
                                          terms: Command.all,
                                          textStyle: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    TextField(
                                      onChanged: (value) {
                                        mailDestinataire = value;
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "Entrez le mail du destinataire :"),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 250.0,
                                          child: RaisedButton(
                                            onPressed: () async {
                                              remplirText(
                                                  MyHomePageState.textFinal);
                                              writeOnPdf();
                                              await savePDF();

                                              Directory documentDirectory =
                                                  await getExternalStorageDirectory();

                                              String documentPath =
                                                  documentDirectory.path;

                                              String fullPath =
                                                  '$documentPath/ardoise.pdf';

                                              Email email = Email(
                                                body:
                                                    'Résumé texte Ardoise Vocale',
                                                subject: 'Ardoise Vocale',
                                                recipients: [mailDestinataire],
                                                attachmentPaths: [fullPath],
                                              );

                                              await FlutterEmailSender.send(
                                                  email);
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Envoyer",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 250.0,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Quitter l'envoi de mail",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  }),
          CustomListTile(
              Icons.settings_outlined,
              'Réinitialisation',
              () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0)), //this right here
                            child: Container(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            SubstringHighlight(
                                              text:
                                                  "Voulez-vous vraiment reinitialiser",
                                              terms: Command.all,
                                              textStyle:
                                                  TextStyle(fontSize: 15),
                                            ),
                                            SubstringHighlight(
                                              text: " les paramètres ?",
                                              terms: Command.all,
                                              textStyle:
                                                  TextStyle(fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 250.0,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Police.taillePolice = 15.0;
                                              MyHomePageState.saveValue();
                                              CouleurFond.backCodeColor = 1;
                                              CouleurFond.backColor =
                                                  Colors.white;
                                              HomeState.saveValueBackCode();
                                              CouleurBulles.bullesCodeColor = 0;
                                              CouleurBulles.bulleSend =
                                                  Colors.blue;
                                              CouleurBulles.bulleReceive =
                                                  Color(0xffE7E7ED);
                                              CouleurBulleState
                                                  .saveValueBullesCode();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "OUI",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 250.0,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "NON",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  }),
          CustomListTile(Icons.exit_to_app_rounded, "Quitter l'application",
              () => {exit(0)}),
        ],
      ),
    );
  }
}
