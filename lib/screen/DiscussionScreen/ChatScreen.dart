import 'package:flutter/material.dart';
import 'package:nanews/screen/mess.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return Container(
            child: ListTile(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_)=>Message()
                )
                
                );
              },
              leading: CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/rav.jpg"),
              ),
              title: Row(
                children: <Widget>[
                  Text(
                    "Octave",
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