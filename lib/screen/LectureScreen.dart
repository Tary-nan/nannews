import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LectureScreen extends StatefulWidget {
  @override
  _LectureScreenState createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(133, 137, 240, 1),
        elevation: 0,
        title: Container(
            height: MediaQuery.of(context).size.height*0.05,
            width: MediaQuery.of(context).size.width*0.7,
            padding: EdgeInsets.only(left:10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
            child: Center(child: Text("https://flutter.io",style: TextStyle(color: Color.fromRGBO(133, 137, 240, 1),),)),
          ),
      ),
      body:WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      
    );
  }
}