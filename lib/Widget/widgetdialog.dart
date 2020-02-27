import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanews/FeatureLogin/GoogleManager.dart';
import 'package:nanews/screen/LoginNumber.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';

showlogin(BuildContext context) {

  //LoginGoogleManager  manger = context.fetch<LoginGoogleManager>();
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)), //this right here
          child: Container(
            height: 450.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:
                   Container(
                     padding: EdgeInsets.all(40),
                     child: Image.asset("images/logo-nan.png"))),
                Expanded(
                  child: Column(
                  children: <Widget>[
                    Container(
                  height: 50,
                  padding: EdgeInsets.only(left:20),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.blue),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Se connecter avec Facebook",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left:20),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(40),
                      ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Se connecter ",
                        style: TextStyle(color: Colors.green),
                      ),
                      Text("avec",style: TextStyle(color: Colors.blue),),
                      Text(" Google",style: TextStyle(color:Colors.yellow),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())),
                                  child: Container(

                    height: 50,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(left:20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color.fromRGBO(133, 137, 240, 1)),
                    child: Row(
                   
                      children: <Widget>[
                        Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Se connecter avec numéro",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text("de mobile",style: TextStyle(color: Colors.white),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                  ],)
                  )
              ],
            ),
          ),
        );
      });
}
