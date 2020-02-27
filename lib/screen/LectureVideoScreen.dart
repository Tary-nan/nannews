import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LectureVideoScreen extends StatefulWidget {
  @override
  _LectureVideoScreenState createState() => _LectureVideoScreenState();
}

class _LectureVideoScreenState extends State<LectureVideoScreen> {
  @override
  Widget build(BuildContext context) {
    List _list = List(7);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                  ),
                  Positioned(
                      top: 20,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.white,
                                size: width * 0.1,
                              ),
                              onPressed: () => Navigator.pop(context)),
                          Container(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.filter_frames,
                                    color: Colors.white,
                                  ),
                                  onPressed: null,
                                ),
                                IconButton(
                                    icon: Icon(Icons.more_horiz,
                                        color: Colors.white),
                                    onPressed: null)
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("images/yaya.jpg"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Hermann",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text("10 reputation 9d",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        color: Color.fromRGBO(133, 137, 240, 1),
                                        padding: EdgeInsets.all(4),
                                        margin: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            Text("Suivre",
                                                style: TextStyle(
                                                    color: Colors.white))
                                          ],
                                        )),
                                    Container(
                                        color: Color.fromRGBO(133, 137, 240, 1),
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Neymar invente un dribble jamais vu dans le football",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.4,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Top Video",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.32,
                            color: Colors.white,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, i) {
                                  return Container(
                                    color: Colors.grey.shade100,
                                    margin: EdgeInsets.only(right: 10),
                                    height: height * 0.24,
                                    width: width * 0.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            Container(
                                              height: height * 0.20,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "une mere abandonne son bébé le cou attacher solidement 😢😢",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.file_upload,
                                                color: Colors.grey),
                                            Text(
                                              "969",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.mode_comment,
                                                color: Colors.grey),
                                            Text(
                                              "146",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.share,
                                                color: Colors.grey),
                                            Text(
                                              "11.1k",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    ..._list.map((f) => Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("images/yaya.jpg"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Hermann",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text("10 reputation 9d",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Formidable",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.file_upload,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "76",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.file_download,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Repondre",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Icon(
                                    Icons.more_horiz,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(

          color: Colors.white,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  height: 30,
                  width: width*0.4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.edit, color: Colors.grey),
                        Text("Comment", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.thumbsUp,
                    color: Colors.grey,
                  ),
                  Text(
                    "655",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.thumbsDown,
                    color: Colors.grey,
                  ),
                  Text(
                    "42",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.comment,
                    color: Colors.grey,
                  ),
                  Text(
                    "655",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.share,
                    color: Colors.grey,
                  ),
                  Text(
                    "1209",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
