import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanews/FeatureArticle/ArticleManager.dart';
import 'package:nanews/FeatureArticle/ArticleModel.dart';
import 'package:nanews/Widget/widgetcontaineradmin.dart';
import 'package:nanews/screen/LectureScreen.dart';
import 'package:nanews/screen/TopNewsPage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sprinkle/Observer.dart';
import 'package:sprinkle/SprinkleExtension.dart';

class PolitiqueScreen extends StatefulWidget {
  String idCategorie;
  PolitiqueScreen({this.idCategorie});
  @override
  _PolitiqueScreenState createState() => _PolitiqueScreenState();
}

class _PolitiqueScreenState extends State<PolitiqueScreen> {

  RefreshController _refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {

    ArticleManager manager = context.fetch<ArticleManager>();
    manager.inFilter.add(widget.idCategorie);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer<GetAllArticleByCategory>(
          stream: manager.collection$,

          onSuccess: (context, data) {
            GetAllArticleByCategory article = data;
            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = Text("pull up load");
                  } else if (mode == LoadStatus.loading) {
                    body = CupertinoActivityIndicator();
                  } else if (mode == LoadStatus.failed) {
                    body = Text("Load Failed!Click retry!");
                  } else if (mode == LoadStatus.canLoading) {
                    body = Text("release to load more");
                  } else {
                    body = Text("No more Data");
                  }
                  return Container(
                    height: 55.0,
                    child: Center(child: body),
                  );
                },
              ),
              controller: _refreshController,
              onRefresh: () async {
                await Future.delayed(Duration(milliseconds: 1000));
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                await Future.delayed(Duration(milliseconds: 1000));
                  setState(() {
                    article=data;
                  });
                if (mounted) setState(() {});
                _refreshController.loadComplete();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      height: height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: article.topNews.edges.length,
                          itemBuilder: (context, i) {

                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:AssetImage("images/img-load.png"),
                                      fit: BoxFit.contain),

                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:NetworkImage(
                                            article.topNews.edges[i].node.image,),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5)),
                                height: height * 0.25,
                                width: width * 0.9,
                                margin: EdgeInsets.only(right: 20),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      bottom: 40,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            article.topNews.edges[i].node.titre,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => TopNewsScreen(data: article.topNews.edges,))),
                      child: Container(
                        height: height * 0.05,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Plus de Top News"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: width, height: 10, color: Colors.grey.shade50
                    ),
                    ...article.allArticles.edges.map((f) => Column(
                          children: <Widget>[
                            GestureDetector(
                              child: containeradmin(context,
                                  comment: f.node.articleCommenter,
                                  like: f.node.articleLike,
                                  site: f.node.site.nom,
                                  titre: f.node.titre,
                                  image: f.node.image),
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_)=>LectureScreen(initialUrl: f.node.link, nomSite: f.node.site.nom,)
                                ));
                              },
                            ),
                            Container(
                                width: width,
                                height: 10,
                                color: Colors.grey.shade50)
                          ],
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }

}
