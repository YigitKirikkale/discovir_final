import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:url_launcher/url_launcher.dart';

const _url =
    'https://store.steampowered.com/app/292030/The_Witcher_3_Wild_Hunt/';

class Witchergame extends StatefulWidget {
  Witchergame({Key key}) : super(key: key);

  @override
  _WitchergameState createState() => _WitchergameState();
}

class _WitchergameState extends State<Witchergame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Witcher 3: Wild Hunt"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Image.network(
                "https://i4.hurimg.com/i/hurriyet/75/750x422/5a018ccfc9de3d10d4f27120.jpg"),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  "Witcher 3 wild hunt 2015 yılında çıkmış ve çıkmasıyla beraber yılın oyunu olarak ses getirmiştir. Geral adlı Efsunger ile yüzlerce hikayeye eşlik edebilmektesiniz"),
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
                  "https://donanimgunlugu.com/wp-content/upload/2020/01/wild-hunt.jpg"),
              pressedImage: Image.network(
                  "https://donanimgunlugu.com/wp-content/upload/2020/01/wild-hunt.jpg"),
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
