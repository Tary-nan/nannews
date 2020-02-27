import 'package:flutter/material.dart';


class DirectGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        
        Expanded(
                  child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 160,
                  childAspectRatio: 0.45,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemCount:5,
                itemBuilder: (context, i) {
                  return bigCont(
                      context, "images/yaya.jpeg", "Hello World");
                },
              )),
        ),
      ],
    );
  }

  Widget bigCont(BuildContext context, String image, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'article');
      },
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                maxRadius: 38,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(
                height: 6,
              ),
              Text("L'INFODROMMME",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(
                height: 6,
              ),
              Container(
                alignment: Alignment.center,
                  width: 80,
                  height: 60,
                  child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              )),
              SizedBox(
                height: 6,
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: Color.fromRGBO(156, 142, 246, 1), width: .4),
                ),
                child: Text(
                  "Politique",
                  style: TextStyle(
                    color: Color.fromRGBO(156, 142, 246, 0.7),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'categories');
                    },
             child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(156, 142, 246, 1),
                  borderRadius: BorderRadius.circular(3)
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 22.0),
                    child: Text(
                      "Suivre",
                      style: TextStyle(color: Colors.white),
                    ),
              ),
              ),
            ],
          )),
    );
  }
}
