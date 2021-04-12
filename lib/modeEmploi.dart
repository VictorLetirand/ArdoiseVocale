import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'couleurFond.dart';

class ModeEmploi extends StatefulWidget {
  @override
  _ModeEmploi createState() => _ModeEmploi();
}

class _ModeEmploi extends State<ModeEmploi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 62, 80, 1),
        title: Text("Mode d'emploi"),
        leading: IconButton(
            icon: Icon(Icons.west), onPressed: () => {Navigator.pop(context)}),
      ),
      backgroundColor: CouleurFond.backColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: [
              CarouselSlider(
                items: [
                  //START Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_START.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_1.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //2st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_2.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //3st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_3.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //4st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_4.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //5st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_5.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //6st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_6.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //7st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_7.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //8st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_8.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //9st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_9.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //10st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_10.png"),
                        //fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  //END Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("images/ME_END.png"),
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
