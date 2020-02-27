import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        elevation: 0,
        title: Text(
          "Logis",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              onTap: () {
                Navigator.pushNamed(context, 'profil');
              },
              child: CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/neymar.jpg"),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 55,
              width: 300,
              //margin: EdgeInsets.only(left:30, right:30),
              decoration: BoxDecoration(
                  color: Colors.grey[100], borderRadius: BorderRadius.circular(100)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Rechercher",
                      suffixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 17,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Autres Propriètaires",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 60),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("images/rav.jpg"),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Recemment",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, i) {
                return Container(
                  child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, 'message');
                    },
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("images/rav.jpg"),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(
                          "Nanguy Marc-Henry",
                          style: TextStyle(color: Color.fromRGBO(152, 172, 231, 1), fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.brightness_1,
                          color: Colors.green,
                          size: 12,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      "Ouais On dit quoi Bro? c'est comment pour demain?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("21 nov"),
                          
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            child: Text(
                              "3",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
