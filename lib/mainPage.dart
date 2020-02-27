import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nanews/screen/DiscussionPage.dart';
import 'package:nanews/screen/NewsPage.dart';
import 'package:nanews/screen/UploadPage.dart';
import 'package:nanews/screen/VideoRadioPage.dart';
import 'package:nanews/screen/profilPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int _selectedIndex = 0;

  List<Widget> tabview = [
    News(),
    VideoRadio(),
    UploadPage(),
    Discussions(),
    ProfilPage()
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 5);
    super.initState();
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabview.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromRGBO(133, 137, 240, 1),
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.newspaper),title: Text("News")),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.tv,),title:Text("Tv/Radio")),
              BottomNavigationBarItem(icon: Icon(Icons.photo_camera,),title: Text("Publié")),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.discourse,),title: Text("Discussions")),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user,),title: Text("Profile"))

            ])
    );
  }
}
