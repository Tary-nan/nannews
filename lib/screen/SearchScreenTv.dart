import 'package:flutter/material.dart';
import 'package:nanews/FeatureSearchArticle/SearchArticleModel.dart';
import 'package:nanews/FeatureSearchTv/SearchTvModel.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class ScreenSearchDelegateTv extends SearchDelegate {

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

    WebResourceManager<SearchTv> manager = context.fetch<WebResourceManager<SearchTv>>();
    manager.inFilter.add(query);

    return Observer<List<SearchTv>>(
        stream: manager.collection$,
        onSuccess: (context, data) {

          List<SearchTv> _article = data;

          return  ListView.separated(
            itemBuilder: (context, index){

              return Container(

                child: ListTile(
                  leading: CircleAvatar(),
                  title: Text(_article[index].id, style: TextStyle(color: Colors.black),),
                  subtitle: Text(_article[index].nom),
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

    WebResourceManager<SearchTv> manager = context.fetch<WebResourceManager<SearchTv>>();
    manager.inFilter.add(query);

    return Observer<List<SearchTv>>(
        stream: manager.collection$,
        onSuccess: (context, data) {

          List<SearchTv> _article = data;

          return  ListView.separated(
            itemBuilder: (context, index){
              print(_article[index].nom);
              return ListTile(
                leading: Container(child: Image.network("https://nanspace.s3.amazonaws.com/nannewsmedia/${_article[index].image}")),
                title: Text(_article[index].nom, style: TextStyle(color: Colors.white)),
              );
            } ,
            itemCount: _article.take(3)?.length ?? 0,
            separatorBuilder: (context, index) => Divider(),
          );;
        }
    );
  }
}