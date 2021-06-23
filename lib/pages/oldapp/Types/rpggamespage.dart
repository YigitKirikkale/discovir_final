import 'package:descovir/pages/oldapp/Games/skyrim/skyrimgame.dart';
import 'package:descovir/pages/oldapp/Games/witcher/witchergame.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class rpggamesPage extends StatelessWidget {
  const rpggamesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RPG Oyunları"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                "https://sm.ign.com/t/ign_tr/screenshot/default/darksoulsiii-2016-04-01-19-14-18-50_363a.1280.jpg"),
            Padding(
              padding: EdgeInsets.all(9),
              child: Text(
                  "RPG (Role Play Games)Rol yapma oyunları bulunduğu dünya çerçevesinde karakterimizin davranış ve hareketlerini kontrol ettiğimiz bir oyun türüdür"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ImageButton(
                height: MediaQuery.of(context).size.height * 0.2,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Elder scrolls skyrim",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
                unpressedImage: Image.network(
                    "https://www.oyunfor.com/Public/upload/steamgames/72850/header.jpg"),
                pressedImage: Image.network(
                    "https://www.oyunfor.com/Public/upload/steamgames/72850/header.jpg"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Skyrimgame(),
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ImageButton(
                height: MediaQuery.of(context).size.height * 0.2,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "The Witcher 3:Wild Hunt",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  )
                ],
                unpressedImage: Image.network(
                    "https://cdn.akamai.steamstatic.com/steam/apps/292030/capsule_616x353.jpg?t=1607418742"),
                pressedImage: Image.network(
                    "https://cdn.akamai.steamstatic.com/steam/apps/292030/capsule_616x353.jpg?t=1607418742"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Witchergame(),
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
