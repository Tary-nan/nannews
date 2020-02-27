import 'package:flutter/material.dart';
import 'package:nanews/screen/commentsPage.dart';

Widget container(BuildContext context,{int partage,String title,int like,int comment,String time,String site,String image}){
  return  Container(
              padding: EdgeInsets.only(top:10,left: 10),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        child: Stack(
                        children: <Widget>[
                           CircleAvatar(
                             backgroundImage: AssetImage("images/ouattara.jpeg"),
                           ),
                           Positioned(
                             left: 30,
                             child: CircleAvatar(
                               backgroundImage: AssetImage("images/yaya.jpg"),
                             ),
                           )
                    ],
                  ),
                      ),
                      Column(
                        children: <Widget>[
                          Text("$partage Partages",style: TextStyle(color: Colors.grey),),
                           Text("Afriksoir.net",style: TextStyle(color: Colors.grey),)
                        
                      ],)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex:8 ,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.155,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(title,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035,fontWeight: FontWeight.bold,),)),
                                Spacer(),
                                
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child:Row(children: <Widget>[
                                  Icon(Icons.favorite_border,color: Colors.grey,size: 20,),
                                  Text(" $like  ",style: TextStyle(color:Colors.grey),),
                                InkWell(
                                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CommentsPage())),
                                  child: Icon(Icons.comment,color: Colors.grey,size: 20,)),
                                 Text(" $comment  ",style: TextStyle(color:Colors.grey),),
                                Text(time,style: TextStyle(color:Colors.grey),),
                                Text("."+site,style: TextStyle(color:Colors.grey),),
                                ],)
                              ),
                              SizedBox(
                                  height:MediaQuery.of(context).size.height*0.005
                                ),
                            ],
                          ),
                        ),
                        
                        ),
                      Expanded(
                        flex:4 ,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.14,
                          child: Image.asset("images/ouattara.jpeg",fit:BoxFit.cover),
                          ),
                        
                        )
                    ],
                  )
               
                ],
              )


            );
}