import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://bethesda.net/tr/game/doom';

class Doomgame extends StatefulWidget {
  Doomgame({Key key}) : super(key: key);

  @override
  _DoomgameState createState() => _DoomgameState();
}

class _DoomgameState extends State<Doomgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doom Eternal"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                "https://shiftdelete.net/wp-content/uploads/2019/06/doom-eternal-icin-beklenen-haber-geldi-2.jpg"),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Doom bir zamanlar dünyada en çok yüklü olan uygulamaydı sayısı Windowsun yüklü olduğu bilgisayar miktarından fazlaydı Doom Eternal ise günümüz teknolojisi ile hazırlanmış muazzam bir FPS oyunudur"),
            ),
            ImageButton(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              children: [
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Satın Al",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
              unpressedImage: Image.network(
                  "https://image.api.playstation.com/vulcan/ap/rnd/202010/0114/ERNPc4gFqeRDG1tYQIfOKQtM.png"),
              pressedImage: Image.network(
                  "https://image.api.playstation.com/vulcan/ap/rnd/202010/0114/ERNPc4gFqeRDG1tYQIfOKQtM.png"),
              onTap: () {
                _launchURL();
              },
            )
          ],
        ),
      ),
    );
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Site Açılamadı $_url';
}
