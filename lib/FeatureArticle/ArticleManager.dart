import 'package:nanews/FeatureArticle/ArticleModel.dart';
import 'package:nanews/FeatureArticle/ArticleService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sprinkle/Manager.dart';

class ArticleManager implements Manager{

  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<GetAllArticleByCategory> _collectionSubject = PublishSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<GetAllArticleByCategory> get collection$ => _collectionSubject.stream;

  ArticleManager() {
    _filterSubject
        .debounceTime(Duration(milliseconds: 500))
        .switchMap((filter) async* {
      yield await ArticleService.getAllArticle(filter: filter);
    }).listen((elements) async {
      _collectionSubject.add(elements);
    });

  }

  @override
  void dispose() {
    _filterSubject.close();
    _collectionSubject.close();
  }
}
