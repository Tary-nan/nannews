import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final TextEditingController _textController = new TextEditingController();

  bool _isComposing = false;
  String name;


   void _handleSubmitted(String text)async{
    setState(() {
      _isComposing = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(133, 137, 240, 1),
        title:  Text("Commentaire",style: TextStyle(color:Colors.white),)
      ),

      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).requestFocus(new FocusNode()),
              child: Column(
          children: <Widget>[
            Expanded(
              flex: 15,
              child: Container(
                margin: EdgeInsets.all(10),
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color:Color.fromRGBO(243,248 , 254, 1),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, i){
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                             Container(
                             height:40,
                             width:40,
                             decoration: BoxDecoration(
                                  color: Color.fromRGBO(133, 137, 240, 1),
                               
                               shape:BoxShape.circle,
                               image: DecorationImage(
                                 image:AssetImage('assets/article.jpg'),
                                 fit:BoxFit.cover,
                               )
                             ),
                           ),
                           SizedBox(width:20),
                           Text(
                             'Annie Adams',
                             style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontFamily: 'BAARS',
                               fontSize: 19
                             ),
                           ),
                           SizedBox(width:100),
                            Text(
                             '20 min',
                             style: TextStyle(
                               fontWeight: FontWeight.w300,
                               fontFamily: 'BAARS',
                               fontSize: 18,
                               color:Colors.grey[400]
                             ),
                           ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(
                            left:10,
                            right: 15
                          ),
                          padding:  EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width/1.2,
                          //height:200,
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Text(
                                  "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.",
                                    style: TextStyle(
                                      fontFamily: 'BAARS',
                                      letterSpacing: 2,
                                      wordSpacing: 1,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey

                                    ),
                                ),
                              ),
                              
                              Row(
                                
                                children: <Widget>[
                                
                                  Text(
                                    'Repondre',
                                    style: TextStyle(
                                      color:Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'BAARS',
                                    ),
                                  ),
                                    Spacer(),
                                   IconButton(
                                    icon:Icon(
                                      Icons.favorite,
                                      color:Colors.redAccent,
                                      ),
                                      onPressed: (){ }, 
                                  ),

                                  Text(
                                    '5k',
                                    style: TextStyle(
                                      color:Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'BAARS',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left:70),
                                  child:CircleAvatar(),
                                  ),
                                  Text("Hermann")
                                  
                              ],
                            ),
                            Container(
                          margin: EdgeInsets.only(
                            left:10,
                            right: 15
                          ),
                          padding:  EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width*0.7,
                          //height:200,
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width/1.2,
                                child: Text(
                                  "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, ",
                                    style: TextStyle(
                                      fontFamily: 'BAARS',
                                      letterSpacing: 2,
                                      wordSpacing: 1,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey

                                    ),
                                ),
                              ),
                              
                              Row(
                                
                                children: <Widget>[
                                  
                                    Spacer(),
                                   IconButton(
                                    icon:Icon(
                                      Icons.favorite,
                                      color:Colors.redAccent,
                                      ),
                                      onPressed: (){ }, 
                                  ),

                                  Text(
                                    '5k',
                                    style: TextStyle(
                                      color:Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'BAARS',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              ),
            ),
              ),
            
            Container(
            child: Container(child: Row(
            children: <Widget>[
              new Flexible(
                child: Container(
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String text) {
                      setState(() {
                        _isComposing = text.length > 0; //new
                      }); //new
                    },
                    onSubmitted: _handleSubmitted,
                    decoration:
                    new InputDecoration.collapsed(hintText: "Commenter"),
                  ),
                  padding: EdgeInsets.all(5),
                ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text) //modified
                      : null,
                ),
              ),
            ],
          ),)
            )
          ],
        ),
      ),
    );
  }
}

      
    
