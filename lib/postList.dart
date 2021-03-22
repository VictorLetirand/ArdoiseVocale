import 'package:ardoise_vocale/police.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'post.dart';
import 'police.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  PostList(this.listItems);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback) {
    this.setState(() {
      callback();
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
          return ChatBubble(
              clipper: ChatBubbleClipper1(type: BubbleType.receiverBubble),
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Color(0xffE7E7ED),
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
        } else {
          return ChatBubble(
            clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 20),
            backGroundColor: Colors.blue,
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
      },
    );
  }
}
