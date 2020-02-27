import 'package:flutter/material.dart';
import 'package:nanews/FeatureRadio/RadioModel.dart';
import 'package:nanews/screen/Lecteur/audioplayout.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';

import 'package:sprinkle/WebResourceManager.dart';

class RadioList extends StatelessWidget  {

  FixedExtentScrollController fixedExtentScrollController =
  new FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {

    WebResourceManager<Radios>  manager = context.fetch<WebResourceManager<Radios>>();
    manager.inFilter.add('');

    return Scaffold(
      body: Observer<List<Radios>>(
        stream: manager.collection$,
        onSuccess: (context, data) {


          List<Radios> radio = data;
          print(radio[0].frequence);

          return ListView.builder(
            itemCount: radio.length,
            itemBuilder: (context, i) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 2,
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(fullscreenDialog: true,builder: (_) => AudioPlayout(url:radio[i].url, frequence: radio[i].frequence, radioTitle: radio[i].nom, radioImg: radio[i].image,)));
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(

                                  decoration: myBoxDecoration(),
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    radio[i].nom,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 1.4),
                              SizedBox(height: 7),
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 20,

                                    /// color:Colors.black,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 9.9),
                                          height: 10,
                                          width: 4,
                                          color: Color.fromRGBO(133, 137, 240, 1),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          height: 20,
                                          width: 4,
                                          color: Color.fromRGBO(133, 137, 240, 1),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          height: 15,
                                          width: 4,
                                          color: Color.fromRGBO(133, 137, 240, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    radio[i].frequence,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(radio[i].image),

                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Color.fromRGBO(133, 137, 240, 1),
          width: 3.0,
        ),
      ),
    );
  }
}
