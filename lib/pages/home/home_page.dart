import 'package:descovir/pages/favorite/favorite_page.dart';
import 'package:descovir/pages/feed/feed_page.dart';
import 'package:descovir/pages/home/aboutpage.dart';
import 'package:descovir/pages/oldapp/anasayfa.dart';
import 'package:descovir/pages/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List tabpages = [FeedPage(), FavoritePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "anasayfa".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        actions: [
          GestureDetector(
            onDoubleTap: () => FirebaseAuth.instance.signOut(),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(FirebaseAuth.instance.currentUser.photoURL),
            ),
          )
        ],
      ),
      body: tabpages[index],
      bottomNavigationBar:
          BottomNavigationBar(currentIndex: index, onTap: _pageChanger, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text("Hızlı Geçiş"),
            ),
            ListTile(
              title: Text("Eski Uygulama"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage1(),
                    ));
              },
            ),
            ListTile(
              title: Text("Hakkında"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mainpage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  _pageChanger(int setindex) {
    setState(() {
      index = setindex;
    });
  }
}
