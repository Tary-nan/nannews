class SearchTv {

  String id ;
  String nom ;
  String image;

  SearchTv({this.id, this.nom, this.image });
  factory SearchTv.fromJson(Map<String, dynamic>json){
    return SearchTv(
      id: json['node']['id'],
      nom: json['node']['nom'],
      image: json['node']['image'],
    );
  }

}
