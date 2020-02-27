import 'package:flutter/material.dart';
import 'package:flutter_playout/player_state.dart';
import 'package:nanews/screen/Lecteur/videoplayout.dart';

class LectureTvScreen extends StatefulWidget {
  String url;
  LectureTvScreen(this.url);
  @override
  _LectureTvScreenState createState() => _LectureTvScreenState();
}

class _LectureTvScreenState extends State<LectureTvScreen> {


  bool _showPlayerControls = true;

  @override
  void initState() {
    super.initState();
    if(widget.url.contains("youtube")){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[

          Positioned(
              left: 10,
              top: 40,
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.url=null;
                    });
                    Navigator.pop(context);
                  })),
          Positioned(
              right: 20,
              top: 50,
              child: Container(
                color: Colors.red,
                child: Text(
                  "Direct",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
