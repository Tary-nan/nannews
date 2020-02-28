import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nanews/Const/utilitaire.dart';
import 'package:nanews/FeatureSearchArticle/SearchArticleModel.dart';

import 'package:sprinkle/Service.dart';

class SearchArticleService implements Service<SearchArticle> {
  @override
  Future<List<SearchArticle>> browse({String filter}) async{
    // TODO: implement browse

    String GetSearchArticle = """
        query SearchArticle{
        allArticles(titre_Icontains:"$filter"){
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
    final QueryOptions _options =
    QueryOptions(documentNode: gql(GetSearchArticle), variables: {});

    QueryResult result = await Const.client.query(_options);
    List data = result.data['allArticles']['edges'];
    Iterable<SearchArticle> elements =
    data.map((_) => SearchArticle.fromJson(_));
    return elements.toList();
  }

}
