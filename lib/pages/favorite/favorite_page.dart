import 'package:descovir/core/models/favoritesModel.dart';
import 'package:descovir/core/sqlite/sqliteManager.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<FavoritesModel> results = [];
  @override
  void initState() {
    _getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: results.isEmpty
          ? Text("data yok")
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  child: ListTile(
                    title: Text(results[index].name),
                    subtitle: Text(results[index].desp),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(results[index].imgUrl),
                    ),
                  ),
                  background: Container(
                    color: Colors.red,
                  ),
                  key: ValueKey(results[index]),
                  onDismissed: (direction) =>
                      _slidableDeleteFavorites(direction, index),
                );
              },
            ),
    );
  }

  _getFavorites() async {
    var data = await SqliteManager().getFavs();
    setState(() {
      results = data;
    });
  }

  _slidableDeleteFavorites(DismissDirection direction, int index) async {
    print(results[index].name);
    await SqliteManager().deleteFav(results[index].name);
    setState(() {
      results.removeAt(index);
    });
    Toast.show("Favorilerden silindi", context);
  }
}
