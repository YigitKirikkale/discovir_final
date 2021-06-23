import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:url_launcher/url_launcher.dart';

const _url =
    'https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/';

class Skyrimgame extends StatefulWidget {
  Skyrimgame({Key key}) : super(key: key);

  @override
  _SkyrimgameState createState() => _SkyrimgameState();
}

class _SkyrimgameState extends State<Skyrimgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skyrim"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                "https://mediatrend.mediamarkt.com.tr/wp-content/uploads/2019/08/Switch-skyrim.jpg"),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Elder Scrolls V:Skyrim 2011 yılında çıkmış ve yılın oyunu ödülüne layık görülmüş bir oyundur. devasa açık dünyası içinde karakteriniz ile her türlü rolü yapabilmektesiniz"),
            ),
            ImageButton(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Satın al",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
              unpressedImage: Image.network(
                  "https://store-images.s-microsoft.com/image/apps.64810.68326442227858632.03782b23-7f26-4a8e-ba87-177bdf2c3c90.fdefe49f-270c-44e5-b660-6d7764b37f0f?w=180&h=270&q=60"),
              pressedImage: Image.network(
                  "https://store-images.s-microsoft.com/image/apps.64810.68326442227858632.03782b23-7f26-4a8e-ba87-177bdf2c3c90.fdefe49f-270c-44e5-b660-6d7764b37f0f?w=180&h=270&q=60"),
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
