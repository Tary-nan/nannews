class TvRadioCategory {

  final String nom;
  final String id;
  final String image;
  final String flux;
  final String backgroundimage;

  TvRadioCategory({this.image, this.flux, this.nom, this.id, this.backgroundimage});

  factory TvRadioCategory.fromJson(Map<String, dynamic> json){
    return TvRadioCategory(
      id: json['node']['id'],
      nom: json['node']['nom'],
      image: json['node']['image'],
      flux: json['node']['flux'],
      backgroundimage: json['node']['backgroundimage'],
    );
  }
}
