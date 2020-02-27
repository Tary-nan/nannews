import 'package:flutter/material.dart';
import 'package:nanews/FeatureArticle/ArticleCategoryService.dart';
import 'package:nanews/FeatureLogin/GoogleManager.dart';
import 'package:nanews/FeatureRadio/RadioModel.dart';
import 'package:nanews/FeatureRadio/RadioService.dart';
import 'package:nanews/FeatureTv/TvCategoryModel.dart';
import 'package:nanews/FeatureTv/TvCategoryService.dart';
import 'package:nanews/mainPage.dart';
import 'package:sprinkle/Overseer.dart';
import 'package:sprinkle/Provider.dart';
import 'package:sprinkle/WebResourceManager.dart';
import 'FeatureArticle/ArticleManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer()
      .register<ArticleManager>(()=> ArticleManager())
      .register<WebResourceManager<Caterory>>(()=> WebResourceManager<Caterory>(CategoryService()))
      .register<WebResourceManager<TvRadioCategory>>(()=> WebResourceManager<TvRadioCategory>(TvCategoryService()))
      .register<WebResourceManager<Radios>>(()=> WebResourceManager<Radios>(RadioService()))
      //.register<LoginGoogleManager>(()=> LoginGoogleManager())

      ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'nanews',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white
        ),
        home: MainPage(),
      ),
    );
  }
}
