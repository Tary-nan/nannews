class Radios {

  final String nom;
  final String id;
  final String image;
  final String url;
  final String frequence;

  Radios({this.image, this.url, this.nom, this.id, this.frequence});

  factory Radios.fromJson(Map<String, dynamic> json){
    return Radios(
      id: json['node']['id'],
      nom: json['node']['name'],
      image: json['node']['radioImg'],
      url: json['node']['radioUrlAudio'],
      frequence: json['node']['frequence'],
    );
  }
}
