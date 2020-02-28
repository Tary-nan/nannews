import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanews/Widget/ScaffoldWrapper.dart';
import 'package:nanews/screen/DiscussionScreen/AppelInterScreen.dart';
import 'package:nanews/screen/DiscussionScreen/AppelScreen.dart';
import 'package:nanews/screen/DiscussionScreen/ChatScreen.dart';
import 'package:nanews/screen/DiscussionScreen/VideoScreen.dart';
import 'package:nanews/screen/SearchScreen.dart';
class Discussions extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScaffoldWrapper(
      length: 2,
      mesTabs: <Widget>[
        Tab(text: "Chat",),
        Tab(text: "Appels Inter..",),
      ],
      search: ()=> showSearch(context: context,delegate: ScreenSearchDelegate()),
      body: TabBarView(children: [
        ChatScreen(),
        AppelInterScreen()
      ]),
    );
  }
}