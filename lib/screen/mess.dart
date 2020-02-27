import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum filterFavorite { favorite, all }

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        title: Row(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                maxRadius: 16,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/rav.jpg"),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Jeremy",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              Icons.brightness_1,
              size: 12,
              color: Colors.green,
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.video, size: 17,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.phone, size: 17,),
            onPressed: () {},
          ),
          PopupMenuButton(
            // onSelected: (filterFavorite onSelectedValue) {
            //   setState(() {
            //     if (onSelectedValue == filterFavorite.favorite) {
            //       //productContainer.showOnlyFavorite();
            //       _showOnlyFavorite = true;
            //     } else {
            //       //productContainer.showAll();
            //       _showOnlyFavorite = false;
            //     }
            //   });
            // },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Effacer le Contenu'),
                  value: filterFavorite.favorite),
              PopupMenuItem(
                child: Text('Paramètre'),
                value: filterFavorite.all,
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/rav.jpg"),
                  ),
                  title: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.height / 4,
                    child: Text(
                      "For today’s article I prepared a stunning animation that gives your Flutter app a lot attention. Moreover I want to to show how easy it to implement with the Flutter and the package simple_animations.",
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.all(12),
                    height: 100,
                    width: MediaQuery.of(context).size.height / 4,
                    child: Text(
                      "The animation consists of a background gradient with a smooth transition. Below there are multiple waves sliding from right to left. On top there is some content. In this case a text that’s greeting you. Hello!",
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(133, 137, 240, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                  ),
                  trailing: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/rav.jpg"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.4)),
                  child: Icon(FontAwesomeIcons.file),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  constraints: BoxConstraints(minHeight: 55),
                  width: 300,
                  //margin: EdgeInsets.only(left:30, right:30),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.grey),
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Envoyer un Message",
                          suffixIcon: Icon(FontAwesomeIcons.instagram),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            fontSize: 17,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
