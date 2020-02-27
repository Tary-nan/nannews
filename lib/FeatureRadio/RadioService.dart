import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nanews/Const/utilitaire.dart';
import 'package:nanews/FeatureRadio/RadioModel.dart';

import 'package:sprinkle/Service.dart';

class RadioService implements Service<Radios> {
  @override
  Future<List<Radios>> browse({String filter}) async{
    // TODO: implement browse
    final QueryOptions _options =
    QueryOptions(documentNode: gql(Const.GetAllRadio), variables: {});

    QueryResult result = await Const.client.query(_options);
    List data = result.data['allRadiostation']['edges'];
    Iterable<Radios> elements =
    data.map((_) => Radios.fromJson(_));
    return elements.toList();
  }

}
