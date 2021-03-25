import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FondEcran extends StatefulWidget {
  @override
  _FondEcran createState() => _FondEcran();
}

class _FondEcran extends State<FondEcran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fonds d'écran"),
        leading: IconButton(
            icon: Icon(Icons.west), onPressed: () => {Navigator.pop(context)}),
        actions: [
          IconButton(
              icon: Icon(Icons.upload_sharp),
              onPressed: () => {Navigator.pop(context)})
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/flutter-logo.png"),
                          //fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/logo-final.png"),
                          //fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/flutter-logo.png"),
                          //fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/logo-v2.png"),
                          //fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 600.0,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    //autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
            ),
            /*Container(
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                    child: Text(
                      'LogIn',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),*/
          ),
        ),
      ),
    );
  }
}
