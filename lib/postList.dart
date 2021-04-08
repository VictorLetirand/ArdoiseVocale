import 'package:ardoise_vocale/couleurBulles.dart';
import 'package:ardoise_vocale/customListSwitchSupprime.dart';
import 'package:ardoise_vocale/myHomePage.dart';
import 'package:ardoise_vocale/police.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'post.dart';
import 'police.dart';
import 'package:ardoise_vocale/couleurBulle.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  void initState() {
    MyHomePageState.getPolicePreferences().then(updatePolice);
    CouleurBulleState.getBullesPreferences().then(updateBullesColor);
    super.initState();
  }

  void updatePolice(double police) {
    setState(() {
      Police.taillePolice = police;
    });
  }

  void updateBullesColor(int bullesCodeColor) {
    setState(() {
      if (bullesCodeColor == 0) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Colors.blue;
        CouleurBulles.bulleReceive = Color(0xffE7E7ED);
      } else if (bullesCodeColor == 1) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Colors.green;
        CouleurBulles.bulleReceive = Colors.red;
      } else if (bullesCodeColor == 2) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Colors.green;
        CouleurBulles.bulleReceive = Colors.grey[100];
      } else if (bullesCodeColor == 3) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Colors.pink[100];
        CouleurBulles.bulleReceive = Colors.purple[200];
      } else if (bullesCodeColor == 4) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(48, 51, 107, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(104, 109, 224, 1);
      } else if (bullesCodeColor == 5) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(34, 166, 179, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(126, 214, 223, 1);
      } else if (bullesCodeColor == 6) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(249, 202, 36, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(246, 229, 141, 1);
      } else if (bullesCodeColor == 7) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(48, 57, 82, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(89, 98, 117, 1);
      } else if (bullesCodeColor == 8) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(234, 32, 39, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(238, 90, 36, 1);
      } else if (bullesCodeColor == 9) {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(18, 137, 167, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(18, 203, 196, 1);
      } else {
        CouleurBulles.bullesCodeColor = bullesCodeColor;
        CouleurBulles.bulleSend = Color.fromRGBO(192, 57, 43, 1);
        CouleurBulles.bulleReceive = Color.fromRGBO(241, 196, 15, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      // ignore: missing_return
      itemBuilder: (context, index) {
        var post = this.widget.listItems[index];
        if (post.provenance == 'Vocal') {
          if (CustomListSwitchSupprime.suppression) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                      Text('Suppression',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                      Text('Suppression',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmer la suppression"),
                      content: const Text(
                          "Voulez-vous vraiment supprimer cette bulle?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Supprimer")),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Annuler"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ChatBubble(
                  clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                  margin: EdgeInsets.only(top: 20),
                  backGroundColor: CouleurBulles.bulleReceive,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Text(
                      post.body,
                      style: TextStyle(
                          color: Colors.black, fontSize: Police.taillePolice),
                    ),
                  )),
              onDismissed: (direction) {
                // index
                setState(() {
                  this.widget.listItems.removeAt(index);
                  MyHomePageState.textFinal.removeAt(index);
                });
              },
            );
          } else {
            return ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
                margin: EdgeInsets.only(top: 20),
                backGroundColor: CouleurBulles.bulleReceive,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    post.body,
                    style: TextStyle(
                        color: Colors.black, fontSize: Police.taillePolice),
                  ),
                ));
          }
        } else {
          if (CustomListSwitchSupprime.suppression) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                      Text('Suppression',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.delete, color: Colors.white),
                      Text('Suppression',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirmer la suppression"),
                      content: const Text(
                          "Voulez-vous vraiment supprimer cette bulle?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Supprimer")),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("Annuler"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: ChatBubble(
                clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(top: 20),
                backGroundColor: CouleurBulles.bulleSend,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: Text(
                    post.body,
                    style: TextStyle(
                        color: Colors.white, fontSize: Police.taillePolice),
                  ),
                ),
              ),
              onDismissed: (direction) {
                // index
                setState(() {
                  this.widget.listItems.removeAt(index);
                  MyHomePageState.textFinal.removeAt(index);
                });
              },
            );
          } else {
            return ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: CouleurBulles.bulleSend,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  post.body,
                  style: TextStyle(
                      color: Colors.white, fontSize: Police.taillePolice),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
