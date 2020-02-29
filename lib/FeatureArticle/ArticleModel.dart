class GetAllArticleByCategory {
  TopNews topNews;
  TopNews allArticles;

  GetAllArticleByCategory({
    this.topNews,
    this.allArticles,
  });

  factory GetAllArticleByCategory.fromJson(Map<String, dynamic> json) => GetAllArticleByCategory(
    topNews: TopNews.fromJson(json["TopNews"]),
    allArticles: TopNews.fromJson(json["allArticles"]),
  );

}

class TopNews {
  List<Edge> edges;

  TopNews({
    this.edges,
  });

  factory TopNews.fromJson(Map<String, dynamic> json) => TopNews(
    edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
  );

}

class Edge {
  Node node;

  Edge({
    this.node,
  });

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
    node: Node.fromJson(json["node"]),
  );

}

class Node {
  String id;
  String intro;
  String titre;
  String image;
  String link;
  Site site;
  int articleLike;
  int articleCommenter;


  Node({
    this.id,
    this.intro,
    this.titre,
    this.image,
    this.link,
    this.site,
    this.articleLike,
    this.articleCommenter
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    intro: json["intro"],
    titre: json["titre"],
    image: json["imageMin"],
    link: json["link"] == null ? null : json["link"],
    site: json["site"] == null ? null : Site.fromJson(json["site"]),
    //articleLike: json["articleLike"]['edgeCount'] ?? null,
    //articleCommenter: json["articleCommenter"]['edgeCount'] ?? null,
  );

}

class Site {
  String nom;
  String url;

  Site({
    this.nom,
    this.url,
  });

  factory Site.fromJson(Map<String, dynamic> json) => Site(
    nom: json["nom"],
    url: json["url"],
  );

}
