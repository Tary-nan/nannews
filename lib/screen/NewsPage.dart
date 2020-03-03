import 'package:flutter/material.dart';
import 'package:nanews/Const/utilitaire.dart';
import 'package:nanews/FeatureArticle/ArticleCategoryService.dart';
import 'package:nanews/Widget/ScaffoldWrapper.dart';
import 'package:nanews/screen/NewsScreen/PolitiqueScreen.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:sprinkle/SprinkleExtension.dart';
import 'package:nanews/screen/SearchScreen.dart';


class News extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    WebResourceManager<Caterory> manager = context.fetch<WebResourceManager<Caterory>>();
    manager.inFilter.add('');

    return Observer<List<Caterory>>(
      stream: manager.collection$,
      onSuccess: (context, data) {
        List<Caterory> category = data;
        print(category.map((x)=> x.id).toList());
        print(category.map((x)=> x.nom).toList());

        return ScaffoldWrapper(
          length: category.length ,
          mesTabs: category.map((x)=> Tab(
            text: x.nom,
          ),).toList(),

          search: ()=> showSearch(context: context,delegate: ScreenSearchDelegate()),
          body: TabBarView(
            children: category.map((x)=> PolitiqueScreen(idCategorie: x.id,)).toList()
          ),
        );
      }
      ,
      onWaiting: (context)=>  ScaffoldWrapper(
      length: Const.CATEGORIES.length ,
      mesTabs: Const.CATEGORIES.map((x)=> Tab(
        text: x,
      ),).toList(),
      //search: ()=> showSearch(context: context,delegate: ScreenSearchDelegate()),
      body: TabBarView(
          children: Const.CATEGORIES.map((x)=> Container()).toList()
      ),
    ),
    );
  }
}

