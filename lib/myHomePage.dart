import 'package:flutter/material.dart';
import 'post.dart';
import 'textImputWidget.dart';
import 'postList.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  MyHomePage(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('hello Men')),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost)
        ]));
  }
}
