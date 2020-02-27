import 'package:flutter/material.dart';
import 'package:nanews/screen/commentsPage.dart';

Widget containeradmin(BuildContext context,
    {int like, int comment, String time, String site, String titre, String image}) {
  return Container(
    margin: EdgeInsets.all(10),
    height: MediaQuery.of(context).size.height * 0.12,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:AssetImage("images/img-load.png"),
                    fit: BoxFit.contain),

                borderRadius: BorderRadius.circular(5)),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.16,
              child: Image.network(image,fit: BoxFit.cover,),
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                titre,
                maxLines: 3,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 15,
                      ),
                      Text(
                        " $like  ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CommentsPage())),
                          child: Icon(
                            Icons.comment,
                            color: Colors.grey,
                            size: 15,
                          )),
                      Text(
                        " $comment  ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "   " + site,
                        
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
