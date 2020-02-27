import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:audioplayer/audioplayer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanews/screen/Lecteur/videoplayout.dart';

AudioPlayer audioPlayer;

class RadioPage extends StatefulWidget {

  String url;
  RadioPage(this.url);
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {


  @override
  void initState() {
    super.initState();
    VideoPlayout(url: widget.url,);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Stack(
        children: <Widget>[
         
          Positioned(
            top: height*0.13,
                      child: Container(
                width: width,
                height: height,
               
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, i) {
                    return Row(
                      children: <Widget>[
                        Container(
                          width: 2,
                          height: height / 15,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Container(
                          width: 2,
                          height: height / 15,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Container(
                          width: 2,
                          height: height / 15,
                          color: Colors.white54,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Container(
                          width: 2,
                          height: height / 10,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                      ],
                    );
                  },
                ) /* Container(child:Image.asset("image/wave.png",fit: BoxFit.cover,),), */
                ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "98.5",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: height / 15),
                ),
                
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                height: 150,
                width:150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                          image: DecorationImage(
                            image: AssetImage("assets/article.jpg"),
                            fit: BoxFit.cover,
                           // colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
                              )
                            ),
                        child: SpinKitWave(
                                color: Colors.white,
                                size: 40.0,
                              ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: width / 10,
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        "Radio NaN",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: height / 30),
                      ),
                      SizedBox(
                        height: height / 80,
                      ),
                      Text(
                        "Radio Nan Fm 200",
                        style: TextStyle(
                            color: Colors.white30,
                            fontWeight: FontWeight.bold,
                            fontSize: height / 50),
                      ),
                      
                    ],
                  ),
                ),
             
                
                Container(
                  child: Column(
                    children: <Widget>[
                      
                      SizedBox(
                        height: height / 15,
                      ),
                      Container(
                        width: 3,
                        height: height / 8,
                        color: Colors.red,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.play_arrow,
                          size: width / 10,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
               
                GestureDetector(
                  child: Transform.rotate(
                    angle: pi / 4,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: (true)
                          ? Transform.rotate(
                              angle: pi / 1.35,
                              child: Icon(
                                Icons.pause,
                                size: width / 10,
                                color: Colors.white,
                              ))
                          : Transform.rotate(
                              angle: pi / 2.3,
                              child: Icon(
                                Icons.play_arrow,
                                size: width / 10,
                                color: Colors.white,
                              )),

                      /*Transform.rotate(
                        angle: pi/1.35,
                        child: Icon(Icons.pause,size: width/10,color: Colors.white,))  ,*/
                    ),
                  ),
                )
              ],
            ),
          ),
           Positioned(
            top: 50,
            left: 30,
            child: InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Icon(Icons.close,color:Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
