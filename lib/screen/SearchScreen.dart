import 'package:flutter/material.dart';
import 'package:nanews/FeatureSearchArticle/SearchArticleModel.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class ScreenSearchDelegate extends SearchDelegate {

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

    WebResourceManager<SearchArticle> manager = context.fetch<WebResourceManager<SearchArticle>>();
    manager.inFilter.add(query);

    return Observer<List<SearchArticle>>(
      stream: manager.collection$,
      onSuccess: (context, data) {

        List<SearchArticle> _article = data;

        return  ListView.separated(
          itemBuilder: (context, index){
            return Container(

              child: ListTile(
                leading: CircleAvatar(),
                title: Text(_article[index].titre, style: TextStyle(color: Colors.white),),
                subtitle: Text(_article[index].intro),
              ),
            );
          } ,
          itemCount: _article?.length ?? 0,
          separatorBuilder: (context, index) => Divider(),
        );;
      }
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {


    WebResourceManager<SearchArticle> manager = context.fetch<WebResourceManager<SearchArticle>>();
    manager.inFilter.add(query);
    
    return Observer<List<SearchArticle>>(
        stream: manager.collection$,
        onSuccess: (context, data) {

          List<SearchArticle> _article = data;

          return  ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                leading: CircleAvatar(),
                title: Text(_article[index].titre, style: TextStyle(color: Colors.white),),
                subtitle: Text(_article[index].intro),
              );
            } ,
            itemCount: _article.take(3)?.length ?? 0,
            separatorBuilder: (context, index) => Divider(),
          );;
        }
    );


  }}