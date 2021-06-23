import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://github.com/YigitKirikkale/flutter_application_1';

class Mainpage extends StatelessWidget {
  const Mainpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkında"),
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
                onLongPress: () {
                  Toast.show("versiyon 0.0.2", context);
                },
                child: Image.asset('assets/mmo.jpg')),
            Text(
                "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3006881 kodlu MOBİL PROGRAMLAMA dersi kapsamında 173006013 numaralı Öğrenci Yiğit Berat Kırıkkale tarafından 25 HAZİRAN 2021 günü yapılmıştır.",
                style: TextStyle(fontSize: 20, color: Colors.black)),
            RaisedButton(
              onPressed: () {
                _launchURL();
              },
              child: Text("Github"),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Site Açılamadı $_url';
}
