
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nanews/Const/utilitaire.dart';

import 'package:sprinkle/Service.dart';

class CategoryService implements Service<Caterory>{

  @override
  Future<List<Caterory>> browse({String filter}) async{
    // TODO: implement browse
    final QueryOptions _options = QueryOptions(
        documentNode: gql(Const.GetAllCategoryQuery),
        variables: {}
    );


    QueryResult result = await Const.client.query(_options);
    List data = result.data['allCategory']['edges'];
    Iterable<Caterory> elements = data.map((_)=> Caterory.fromJson(_));
    return elements.toList();

  }
}

class Caterory {
  final String nom;
  final String id;

  Caterory({this.nom, this.id});

  factory Caterory.fromJson(Map<String, dynamic> json){
    return Caterory(
      id: json['node']['id'],
      nom: json['node']['nom'],
    );
  }
}
