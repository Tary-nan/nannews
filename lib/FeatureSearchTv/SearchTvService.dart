import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nanews/Const/utilitaire.dart';
import 'package:nanews/FeatureSearchTv/SearchTvModel.dart';

import 'package:sprinkle/Service.dart';

class SearchTvService implements Service<SearchTv> {
  @override
  Future<List<SearchTv>> browse({String filter}) async{
    // TODO: implement browse

    String GetSearchTv = """
        query SearchTv{
          allTelevision(nom_Icontains:"$filter"){
            edges{
              node{ 
                 id
                 nom
                image
              }
            }
          }      
      }
     """;
    final QueryOptions _options =
    QueryOptions(documentNode: gql(GetSearchTv), variables: {});

    QueryResult result = await Const.client.query(_options);
    List data = result.data['allTelevision']['edges'];
    Iterable<SearchTv> elements =
    data.map((_) => SearchTv.fromJson(_));
    return elements.toList();
  }

}
