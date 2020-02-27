import 'package:flutter/material.dart';
import 'package:nanews/screen/commentsPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget video(BuildContext context,
    {String userpicture,
    String username,
    int userpost,
    String date,
    String title,
    int like,
    int comment,
    int share}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(userpicture),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(username, style: TextStyle(color: Colors.grey)),
                    Text("$userpost reputation $date",
                        style: TextStyle(color: Colors.grey)),
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.arrow_drop_down))
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05))),
      Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/yaya.jpg",
                fit: BoxFit.cover,
              )),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Icon(
                Icons.play_circle_outline,
                size: 100,
                color: Colors.white.withOpacity(0.7),
              ))
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.thumbsUp,color: Colors.grey,size: 20,
                ),
                SizedBox(
                width: 5,
              ),
                Text("49",style: TextStyle(color: Colors.grey),),
                SizedBox(
                width: 10,
              ),
                Icon(
                  FontAwesomeIcons.thumbsDown,color: Colors.grey,size: 20,
                ),
                SizedBox(
                width: 5,
              ),
                Text("9",style: TextStyle(color: Colors.grey),)
              ],
            )
          ),
          Container(
              child: Row(
            children: <Widget>[
              InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CommentsPage())),
                  child: Icon(
                    Icons.comment,
                    color: Colors.grey,
                    size: 20,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                "$comment",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.share,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$share",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )),
        ],
      ),
      SizedBox(height: 10),
      Container(
          width: MediaQuery.of(context).size.width,
          height: 10,
          color: Colors.grey.shade50)
    ],
  );
}
