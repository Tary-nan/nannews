import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:nanews/Const/utilitaire.dart';
import 'package:nanews/FeatureTv/TvCategoryModel.dart';

import 'package:sprinkle/Service.dart';

class TvCategoryService implements Service<TvRadioCategory> {
  @override
  Future<List<TvRadioCategory>> browse({String filter}) async {
    // TODO: implement browse
    final QueryOptions _options =
        QueryOptions(documentNode: gql(Const.GetTv), variables: {});

    QueryResult result = await Const.client.query(_options);
    List data = result.data['allTelevision']['edges'];
    Iterable<TvRadioCategory> elements =
        data.map((_) => TvRadioCategory.fromJson(_));
    return elements.toList();
  }
}
