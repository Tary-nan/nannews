import 'package:flutter/material.dart';

class ScreenSearchDelegate extends SearchDelegate {

  ScreenSearchDelegate();

  List managers;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.close), onPressed: (){
        query = '';
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
      Navigator.of(context).pop();
    },);
  }

  @override
  Widget buildResults(BuildContext context) {

    if(query.length < 1) {
      return Center(child: Text("your query must contains 1 letters"),);
    }

   // managers.inFilter.add(query);

    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

  //  managers.inFilter.add(query);
    return Container();


  }}