import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://www.escapefromtarkov.com/';

class Tarkovgame extends StatefulWidget {
  Tarkovgame({Key key}) : super(key: key);

  @override
  _TarkovgameState createState() => _TarkovgameState();
}

class _TarkovgameState extends State<Tarkovgame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escape From Tarkov"),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Image.network(
              "https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2020/1/10/qajrcuuxugyqorljtvh9/escape-from-tarkov"),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
                "Escape From Tarkov son yılların kendinden en çok söz ettirek oyunudur. Hardcore ve zor yapısı ile softcore oyuncuların kabusu olmakla beraber ayrıntı seviyesi muazzamdır. "),
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
                "https://www.technogger.com/wp-content/uploads/2020/02/escape-from-tarkov.jpg"),
            pressedImage: Image.network(
                "https://www.technogger.com/wp-content/uploads/2020/02/escape-from-tarkov.jpg"),
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
