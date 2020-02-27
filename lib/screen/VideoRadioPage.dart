import 'package:flutter/material.dart';
import 'package:nanews/Widget/ScaffoldWrapper.dart';

import 'package:nanews/screen/VideoRadioScreen/VideoBuzzScreen.dart';
import 'package:nanews/screen/VideoRadioScreen/list_radio.dart';
import 'package:nanews/screen/VideoRadioScreen/tv.dart';

class VideoRadio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ScaffoldWrapper(
      length: 3,
      mesTabs: <Widget>[
        Tab(text: "TV",),
        Tab(text: "Radio",),
        Tab(text: "Video Buzz",),
      ],
      body: TabBarView(children: [
        Tv(),
        RadioList(),
        VideoBuzz(),
      ]),
    );
  }
}