import 'package:flutter/material.dart';
import 'package:nanews/FeatureArticle/ArticleCategoryService.dart';
import 'package:nanews/Widget/ScaffoldWrapper.dart';
import 'package:nanews/screen/NewsScreen/PolitiqueScreen.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class News extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    WebResourceManager<Caterory> manager = context.fetch<WebResourceManager<Caterory>>();
    manager.inFilter.add('');

    return Observer<List<Caterory>>(
      stream: manager.collection$,
      onSuccess: (context, data) {
        List<Caterory> category = data;

        return ScaffoldWrapper(
          length: category.length ,
          mesTabs: category.map((x)=> Tab(
            text: x.nom,
          ),).toList(),
          body: TabBarView(
            children: category.map((x)=> PolitiqueScreen(idCategorie: x.id,)).toList()
          ),
        );
      }
    );
  }
}
