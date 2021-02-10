import 'package:flutter/material.dart';
import 'post.dart';
import 'textImputWidget.dart';
import 'postList.dart';
import 'customListTile.dart';

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
              Container(
                height: 50.0,
                child: DrawerHeader(child: Text("This is drawer header")),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.blue[900],
                  Colors.blue[300],
                ])),
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
              ),
              CustomListTile(Icons.file_copy_sharp, "Mode d'emploi", () => {}),
              CustomListTile(
                  Icons.picture_in_picture_sharp, "Fond d'écran", () => {}),
              CustomListTile(Icons.color_lens_rounded,
                  'Changer couleur du texte vocal', () => {}),
              CustomListTile(Icons.color_lens_rounded,
                  'Changer couleur du texte écrit', () => {}),
              CustomListTile(
                  Icons.phonelink_erase, 'Effacer en touchant', () => {}),
              CustomListTile(
                  Icons.priority_high_sharp, 'Ponctuation', () => {}),
              CustomListTile(Icons.mail, 'Envoi par Mail', () => {}),
              CustomListTile(
                  Icons.settings_outlined, 'Paramètres par défaut', () => {}),
            ],
          ),
        ),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost)
        ]));
  }
}
