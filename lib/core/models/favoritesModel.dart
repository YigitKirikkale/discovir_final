class FavoritesModel {
  int id;
  String name;
  String imgUrl;
  String desp;
  FavoritesModel({this.desp, this.imgUrl, this.name , this.id});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': imgUrl,
      'desp': desp, 
    };
  }
}
