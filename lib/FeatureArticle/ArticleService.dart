
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nanews/Const/utilitaire.dart';
import 'package:nanews/FeatureArticle/ArticleModel.dart';

class ArticleService{

  static Future<GetAllArticleByCategory> getAllArticle({String filter}) async{

    String GetAllDataByCategory = """ 
            query GetAllDataByCategory{
            TopNews:allArticles(categorie:"$filter", isTopNew:true){
              edges{
                node{
                  id
                  intro
                  titre
                  imageMin
                  link
                }
              }
            }
            allArticles(categorie:"$filter"){
              edges{
                node{ 
                  id
                  intro
                  titre
                  imageMin
                  site{
                    nom
                    url
                  }
                }
              }
            }
          }
 """;

    final QueryOptions _options = QueryOptions(
      documentNode: gql(GetAllDataByCategory),
      variables: {
        'filter': filter,
      }
    );

    QueryResult result = await Const.client.query(_options);
    GetAllArticleByCategory elements = GetAllArticleByCategory.fromJson(result.data);
    return elements;
  }
}
