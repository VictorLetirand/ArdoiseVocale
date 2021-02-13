import 'package:flutter/material.dart';
import 'post.dart';
import 'textImputWidget.dart';
import 'postList.dart';
import 'customListTile.dart';
import 'customListSwitch.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "Victor"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('hello Men')),
      drawer: Drawer(
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
                          'images/flutter-logo.png',
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
            CustomListTile(Icons.file_copy_sharp, "Mode d'emploi", () => {}),
            CustomListTile(
                Icons.picture_in_picture_sharp, "Fond d'écran", () => {}),
            CustomListTile(Icons.color_lens_rounded,
                'Changer couleur du texte vocal', () => {}),
            CustomListTile(Icons.color_lens_rounded,
                'Changer couleur du texte écrit', () => {}),
            CustomListSwitch(Icons.delete, 'Effacer en touchant', Icons.delete),
            CustomListSwitch(Icons.priority_high_sharp, 'Ponctuation',
                Icons.priority_high_sharp),
            CustomListTile(Icons.mail, 'Envoi par Mail', () => {}),
            CustomListTile(
                Icons.settings_outlined, 'Paramètres par défaut', () => {})
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost),
        ],
      ),
    );
  }
}
