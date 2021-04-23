import 'package:flutter/material.dart';
import 'package:ardoise_vocale/myHomePage.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    if (controller.text.isNotEmpty && controller.text.trim() != "") {
      String texte = controller.text.capitalize();
      widget.callback(texte);
      controller.clear();
      MyHomePageState.needsScroll = true;
      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type un message:",
            suffixIcon: IconButton(
              icon: Icon(Icons.check),
              tooltip: "Envoyer le message",
              splashColor: Colors.blue[800],
              onPressed: () => this.click(),
            )));
  }
}
