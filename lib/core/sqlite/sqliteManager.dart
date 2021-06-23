import 'dart:ffi';

import 'package:descovir/core/models/favoritesModel.dart';


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteManager {
  //init database
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'descovir.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, picture TEXT NOT NULL ,desp TEXT NOT NULL)",
        );
        
      },
      version: 1,
    );
  }

  Future<void> insertFav(FavoritesModel model) async {
    var db = await initializeDB();
    var getdata = await getFavs();
    var listnames = getdata.map((e) => e.name).toSet();
    if (listnames.contains(model.name)) {
      await deleteFav(model.name);
      try {
        await db.insert("favorites", model.toMap());
      } catch (e) {}
    } else {
      try {
        await db.insert("favorites", model.toMap());
      } catch (e) {}
    }
  }

  Future<List<FavoritesModel>> getFavs() async {
    var db = await initializeDB();
    final List<Map<String, dynamic>> data = await db.query("favorites");
    return List.generate(data.length, (index) {
      return FavoritesModel(
          name: data[index]["name"],
          desp: data[index]["desp"],
          imgUrl: data[index]["picture"]);
    });
  }

  Future<void> deleteFav(String name) async {
    var db = await initializeDB();
    await db.delete("favorites", where: "name = ?", whereArgs: [name]);
  }



 
}
