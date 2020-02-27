import 'package:flutter/material.dart';
import 'package:nanews/FeatureLogin/GoogleManager.dart';
import 'package:nanews/Widget/widgetdialog.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/yaya.jpg'),
                            colorFilter: ColorFilter.mode(
                                Colors.black54, BlendMode.darken),
                            fit: BoxFit.cover)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text('Mon Profil',
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                    fontFamily: "Quillain",
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.favorite_border,
                                  color: Colors.white, size: 30),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  right: 20,
                  child: Container(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("images/yaya.jpg"),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 30,
                  right: 30,
                  child: Container(
                    height: 300,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 55),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'NaN News',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 21,
                                  fontFamily: 'BAARS',
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.add_location, color: Colors.grey[400]),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Angré Gestoci',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontFamily: 'BAARS',
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                           
                            Column(
                              children: <Widget>[
                                Text(
                                  '125',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'BAARS',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Posts',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'BAARS',
                                      color: Colors.grey[400]),
                                )
                              ],
                            ),
                            
                            Column(
                              children: <Widget>[
                                Text(
                                  '249',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'BAARS',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey[400],
                                    fontFamily: 'BAARS',
                                  ),
                                )
                              ],
                            ),
                          
                            Column(
                              children: <Widget>[
                                Text(
                                  '130',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'BAARS',
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'BAARS',
                                      color: Colors.grey[400]),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: RaisedButton(
                                  color: Color.fromRGBO(133, 137, 240, 1),
                                  onPressed: () {
                                    //   Navigator.push(context, MaterialPageRoute(
                                    //     builder: (context)=>HomQQQeFacebook()
                                    // ));
                                  },
                                  child: Container(
                                      child: Text(
                                    'Share',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'BAARS',
                                    ),
                                  )),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: RaisedButton(
                                  color: Color.fromRGBO(133, 137, 240, 1),
                                  onPressed: () {
                                    //   Navigator.push(context, MaterialPageRoute(
                                    //     builder: (context)=>HomQQQeFacebook()
                                    // ));
                                    showlogin(context);
                                  },
                                  child: Container(
                                      child: Text(
                                    'Suivre',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'BAARS',
                                    ),
                                  )),
                                ),
                              ),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 50,
                  ))
              ],
            ),
          ),
          Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      pofilDetails(Icons.phone, '02020202'),
                      pofilDetails(Icons.email, 'bassolehermann@nan.ci'),
                    ],
                  ),
                ),
              ),
         
        ],
      ),
    );
  }
}

/*

Widget _buildSignOutBt(LoginGoogleManager bloc) {
  return StreamBuilder(
    stream: bloc.googleAccount,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Text('Logout'),
          color: Color(Colors.blue.blue),
          textColor: Colors.white,
          onPressed: snapshot.hasData
              ? () async {
            bloc.signOutGoogle();
          }
              : null);
    },
  );
}


Widget _buildUserInfo(LoginGoogleManager bloc) {
  return StreamBuilder(
    stream: bloc.googleAccount,
    builder: (BuildContext context, AsyncSnapshot<GoogleSignInAccount> snapshot) {
      if (!snapshot.hasData) {
        return Container(
          child: Text('No info!!!'),
        );
      }

      return Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text('Name: '), Text(snapshot.data.displayName.toString())],
          ),
          Row(
            children: <Widget>[Text('Email: '), Text(snapshot.data.email)],
          ),
          Row(
            children: <Widget>[Text('Id: '), Text(snapshot.data.id)],
          ),
          Image.network(
            snapshot.data.photoUrl.toString(),
            width: 200.0,
            height: 200.0,
          ),
        ],
      );
    },
  );
}

 */

Widget pofilDetails(IconData icones, String name) {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(133, 137, 240, 1),
            ),
            child: Icon(icones, color: Colors.white),
          )
        ],
      ),
      SizedBox(width: 30),
      Column(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontFamily: 'BAARS',
                fontSize: 17),
          ),
        ],
      ),
    ],
  );
}

Widget sociallink(Color backColor, IconData myIcon, Color couleur) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                height: 55,
                width: 55,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: backColor),
                child: Icon(myIcon, color: couleur, size: 40))
          ],
        )
      ],
    ),
  );
}

/* */
