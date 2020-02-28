class SearchArticle {

  String id ;
  String intro ;
  String titre ;
  String imageMin ;
  String urlSite ;
  String nomlSite ;

  SearchArticle({this.id, this.intro, this.titre, this.imageMin, this.nomlSite, this.urlSite});

  factory SearchArticle.fromJson(Map<String, dynamic>json){
    return SearchArticle(
      id: json['node']['id'],
      intro: json['node']['intro'],
      titre: json['node']['titre'],
      imageMin: json['node']['imageMin'],
      urlSite: json['node']['nom'],
      nomlSite: json['node']['url'],
    );
  }

}
