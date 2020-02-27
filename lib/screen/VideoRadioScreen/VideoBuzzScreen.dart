import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanews/Widget/widgetvideo.dart';
import 'package:nanews/screen/LectureScreen.dart';
import 'package:nanews/screen/LectureVideoScreen.dart';


class VideoBuzz extends StatefulWidget {
  @override
  _VideoBuzzState createState() => _VideoBuzzState();
}

class _VideoBuzzState extends State<VideoBuzz> {
  List listrecent=List(5);
  @override
  Widget build(BuildContext context) {
      double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                ...listrecent.map((f)=>GestureDetector(
                  onTap: ()=>Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_)=> LectureVideoScreen()
                      )
                  ),
                  child: video(context,title: "Le plongeon de la mort (attetion âmes sensibles)",comment: 0,like: 63,date: "4 fevrier",share: 2,username: "HurdebamaObeima",userpicture: "images/ouattara.jpeg",userpost: 21025)),),
              ],
            )   ,
          ],
        ),
      ),
      
    );
  }
}