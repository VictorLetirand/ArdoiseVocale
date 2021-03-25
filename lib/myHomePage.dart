import 'package:flutter/material.dart';
import 'myDrawer.dart';
import 'post.dart';
import 'police.dart';
import 'textImputWidget.dart';
import 'postList.dart';
import 'substring_highlighted.dart';
import 'speech_api.dart';
import 'utils.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  String text = '';
  bool isListening = false;
  //double taillePolice = 15.0;

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, "ecris"));
    });
  }

  void newPostVoc(String text) {
    this.setState(() {
      posts.add(new Post(text, "Vocal"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ardoise Vocale"),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Police.taillePolice += 3;
                    print(Police.taillePolice);
                  });
                },
                child: Icon(
                  Icons.zoom_in,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Police.taillePolice -= 3;
                    print(Police.taillePolice);
                  });
                },
                child: Icon(Icons.zoom_out),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    posts.clear();
                  });
                },
                child: Icon(Icons.delete),
              )),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(child: PostList(this.posts)),
          SingleChildScrollView(
            reverse: true,
            padding: const EdgeInsets.all(30).copyWith(bottom: 75),
            child: SubstringHighlight(
              text: text,
              terms: Command.all,
              textStyle: TextStyle(
                fontSize: 28.0,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              textStyleHighlight: TextStyle(
                fontSize: 32.0,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                  heroTag: "bouton annuler",
                  child: Icon(Icons.cancel),
                  mini: true,
                  backgroundColor: Colors.red,
                  onPressed: () {
                    setState(() {
                      text = '';
                    });
                  }),
              FloatingActionButton(
                heroTag: "bouton parler",
                child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
                onPressed: toggleRecording,
              ),
              FloatingActionButton(
                  heroTag: "bouton Valider",
                  child: Icon(Icons.check),
                  mini: true,
                  backgroundColor: Colors.green,
                  onPressed: () {
                    if (text != "") {
                      newPostVoc(text);
                      setState(() {
                        text = '';
                      });
                    }
                  }),
            ],
          ),
          TextInputWidget(this.newPost),
        ],
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => this.text = text,
      onListening: (isListening) {
        setState(() => this.isListening = isListening);
      });
}
