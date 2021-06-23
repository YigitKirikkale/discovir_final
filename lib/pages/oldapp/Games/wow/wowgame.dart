import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://worldofwarcraft.com/en-us/';

class Wowgame extends StatefulWidget {
  Wowgame({Key key}) : super(key: key);

  @override
  _WowgameState createState() => _WowgameState();
}

class _WowgameState extends State<Wowgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("World Of Warcraft"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Image.network(
              "https://www.donanimhaber.com/cache-v2/?t=20201209170727&width=-1&text=0&path=https://img.donanimhaber.com/images/haber/127684/src/world-of-warcraft-shadowlands-en-hizli-satan-pc-oyunu-oldu127684_0.jpg"),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
                "World Of Warcraft MMO tarihinin en eski ve köklü yapımlarından biridir, onlarca harita ve zindan içinde kaybolabilir arkadaşlarınızla eğlenebilirsiniz "),
          ),
          ImageButton(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.5,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Siteye git",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
            unpressedImage: Image.network(
                "https://www.tekyedi.com/wp-content/uploads/2019/08/classic.jpg"),
            pressedImage: Image.network(
                "https://www.tekyedi.com/wp-content/uploads/2019/08/classic.jpg"),
            onTap: () {
              _launchURL();
            },
          )
        ],
      )),
    );
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Site Açılamadı $_url';
}
