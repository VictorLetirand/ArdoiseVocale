import 'package:flutter/material.dart';
import 'myHomePage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ModeEmploi extends StatefulWidget {
  @override
  _ModeEmploi createState() => _ModeEmploi();
}

class _ModeEmploi extends State<ModeEmploi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mode d'emploi"),
        leading: IconButton(
            icon: Icon(Icons.west),
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()))
                }),
      ),
      body: Padding(
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
        ),
      ),
    );
  }
}
