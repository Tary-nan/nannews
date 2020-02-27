import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class VideoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return Container(
            height: 420,
            
            margin: EdgeInsets.only(bottom:10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("images/image_1.jpg"),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "France 24",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 10,),
                   Container(
                     width: MediaQuery.of(context).size.width/1.05,
                      child: Text(
                        "Un regard français sur le monde. L'actu internationale 24h/24. Inscription Newsletter. Application Mobile Dispo. Catégories: Grand Angle, Nos Émissions, Partenariats.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                 SizedBox(height: 10,),
                 Container(
                
                width: MediaQuery.of(context).size.width,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                   
                    image: DecorationImage(
                        image: AssetImage("images/image_2.jpg"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.darken),
                        fit: BoxFit.cover)),
                child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white.withOpacity(0.6)),
                      child: Icon(Icons.play_arrow, size: 40,),
                    ),
              ),
          
               Container(
                 constraints: BoxConstraints(
                   maxHeight: 50,
                   maxWidth: MediaQuery.of(context).size.width
                 ),
                 child: Container()
                 )
              ],
            ),
          );
        },
      ),
    );
  }
}
