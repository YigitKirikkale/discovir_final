import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:descovir/core/models/favoritesModel.dart';
import 'package:descovir/core/sqlite/sqliteManager.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('places').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return InkWell(
              onTap: () => _insertFavorites(document.data()["name"],
                  document.data()["imgUrl"], document.data()["desp"]),
              child: Card(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          document.data()["imgUrl"],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(document.data()["name"]),
                      Text(document.data()["desp"])
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  _insertFavorites(String name, String imageUrl, String desp) async {
    print("çalıştı");
    await SqliteManager()
        .insertFav(FavoritesModel(name: name, imgUrl: imageUrl, desp: desp));
    Toast.show("Başarıyla favorilere eklendi", context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.CENTER,
        backgroundColor: Colors.red);
  }
}
