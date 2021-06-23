import 'package:descovir/pages/oldapp/Games/bdo/blackdesertgame.dart';
import 'package:descovir/pages/oldapp/Games/wow/wowgame.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class mmogamespage extends StatelessWidget {
  const mmogamespage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MMO oyunları"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/wowmain.jpg"),
            Padding(
              padding: EdgeInsets.all(9),
              child: Text(
                  "MMO (Devasa Çok oyunculu çevrimiçi oyun) Açık dünya üzerinde pek çok aktivitenin bir arada bulunduğu çeşitli mekanikleri ile PVP ve PVE materyallerini içinde barındıran oyunlardır"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ImageButton(
                height: MediaQuery.of(context).size.height * 0.2,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "World Of Warcraft",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
                unpressedImage: Image.network(
                    "https://upload.wikimedia.org/wikipedia/tr/6/6c/World-of-warcraft-logo.jpg"),
                pressedImage: Image.network(
                    "https://upload.wikimedia.org/wikipedia/tr/6/6c/World-of-warcraft-logo.jpg"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Wowgame(),
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
                      "Black Desert Online",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
                unpressedImage: Image.network(
                    "https://img.bolumsonucanavari.com/images/Upload/6fec2266-d79c-46b4-8547-d0d988d4d02f.jpg"),
                pressedImage: Image.network(
                    "https://img.bolumsonucanavari.com/images/Upload/6fec2266-d79c-46b4-8547-d0d988d4d02f.jpg"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => blackdesertgame(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
