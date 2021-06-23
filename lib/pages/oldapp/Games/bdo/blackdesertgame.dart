import 'package:descovir/pages/oldapp/Games/bdo/calculator.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.tr.playblackdesert.com/main/index';

class blackdesertgame extends StatefulWidget {
  blackdesertgame({Key key}) : super(key: key);

  @override
  _blackdesertgameState createState() => _blackdesertgameState();
}

class _blackdesertgameState extends State<blackdesertgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Black Desert Online"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network("https://wallpaperaccess.com/full/1283695.jpg"),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Black desert, Bir açık dünya çok oyunculu Rol yapma oyunudur. İçinde bulunan 22 adet sınıf ile savaşın ve çok oyunculu dünyanın zevkini çıkarın",
              ),
            ),
            Row(
              children: [
                ImageButton(
                  
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.5,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Pazar Vergisi hesapla",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                  unpressedImage: Image.network(
                      "https://s1.pearlcdn.com/TR/Upload/Community/db94cca19d720210210152002443.jpg"),
                  pressedImage: Image.network(
                      "https://s1.pearlcdn.com/TR/Upload/Community/db94cca19d720210210152002443.jpg"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calculator()));
                  },
                ),
                ImageButton(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.5,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Siteye Git",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                  unpressedImage: Image.network(
                      "https://play-lh.googleusercontent.com/NO4OIFpEhQFi8dLoCUDxGlfjvuxKpHkLRs2dlSyz75_3R-RMiSdVu2uD5Lll12GhOA"),
                  pressedImage: Image.network(
                      "https://play-lh.googleusercontent.com/NO4OIFpEhQFi8dLoCUDxGlfjvuxKpHkLRs2dlSyz75_3R-RMiSdVu2uD5Lll12GhOA"),
                  onTap: () {
                    _launchURL();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Site Açılamadı $_url';
}
