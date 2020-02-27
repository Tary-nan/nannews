

import 'package:graphql_flutter/graphql_flutter.dart';

class Const {



  static const GetTv = """ 
        query GetTv{
        allTelevision{
          edges{
            node{
              id
              nom
              image
              flux
              backgroundimage
            }
          }
        }
      }
""";
  static const GetAllCategoryQuery = """
          query GetAllCategory{
          allCategory(status:true){
            edges{
              node{
                id
                nom
              }
            }
          }
        }
   """;
  static const GetAllDataByCategory = """ 
  
  query GetAllDataByCategory{
  TopNews:allArticles(categorie:"Q2F0ZWdvcnlOb2RlOjE="){
    edges{
      node{
        id
        intro
        titre
        image
      	link
      }
    }
  }
  allArticles(categorie:"Q2F0ZWdvcnlOb2RlOjE="){
    edges{
      node{ 
        id
        intro
        titre
        image
        site{
          nom
          url
        }
      }
    }
  }
}
 """;

  static const GetAllRadio = """ 
        query GetRadio{
          allRadiostation(pays:"UGF5c0xpc3RlTm9kZTozNzI="){
            edges{
              node{
                id
                name
                radioImg
                radioUrlAudio
                frequence
              }
            }
          }
        }
 """;

  static HttpLink httpLink = HttpLink(
    uri: 'https://nannews.nan.ci/graphql',
  );
  static GraphQLClient client = GraphQLClient(
    cache: InMemoryCache(),
    link: httpLink
  );

}