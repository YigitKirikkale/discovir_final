import 'package:descovir/pages/oldapp/Games/doom/doomgame.dart';
import 'package:descovir/pages/oldapp/Games/tarkov/tarkovgame.dart';
import 'package:flutter/material.dart';

import 'package:imagebutton/imagebutton.dart';

class fpsgamespage extends StatelessWidget {
  const fpsgamespage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FPS Oyunları"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network("https://wallpapercave.com/wp/wp1943802.jpg"),
            Padding(
              padding: EdgeInsets.all(9),
              child: Text(
                  "FPS (First Person Shooter) oyunları Birinci şahıs kamerasından oynanan shooter mekaniklerini barındıran PVP ve PVE Öğeleri ile oynanan Oyunlardır"),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: ImageButton(
                height: MediaQuery.of(context).size.height * 0.2,
                children: [
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Escape From Tarkov",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
                unpressedImage: Image.network(
                    "https://static.wikia.nocookie.net/escape-from-tarkov/images/f/fc/Killa_promo_image.jpg/revision/latest?cb=20181231141558"),
                pressedImage: Image.network(
                    "https://static.wikia.nocookie.net/escape-from-tarkov/images/f/fc/Killa_promo_image.jpg/revision/latest?cb=20181231141558"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tarkovgame(),
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
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Doom Eternal",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))
                ],
                unpressedImage: Image.network(
                    "https://compass-ssl.xbox.com/assets/1d/e6/1de6447e-cba5-47b5-810a-81b385e1e27f.jpg?n=DOOM-Eternal_GLP-Page-Hero-1084_1920x1080_02.jpg"),
                pressedImage: Image.network(
                    "https://compass-ssl.xbox.com/assets/1d/e6/1de6447e-cba5-47b5-810a-81b385e1e27f.jpg?n=DOOM-Eternal_GLP-Page-Hero-1084_1920x1080_02.jpg"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Doomgame()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
