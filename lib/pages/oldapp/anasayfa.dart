import 'package:descovir/pages/oldapp/Types/fpsgamespage.dart';
import 'package:descovir/pages/oldapp/Types/mmogamespage.dart';
import 'package:descovir/pages/oldapp/Types/rpggamespage.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class Homepage1 extends StatelessWidget {
  const Homepage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              "Eski Uygulama",
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ImageButton(
              height: MediaQuery.of(context).size.height * 0.25,
              children: [
                Text(
                  "RPG Oyunları",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
              unpressedImage: Image.network(
                  "https://i.pinimg.com/originals/22/81/30/228130715ee841a5e2528de6e3ae1820.jpg"),
              pressedImage: Image.network(
                  "https://i.pinimg.com/originals/22/81/30/228130715ee841a5e2528de6e3ae1820.jpg"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => rpggamesPage(),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ImageButton(
              height: MediaQuery.of(context).size.height * 0.25,
              children: [
                Text(
                  "MMO Oyunları",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
              unpressedImage: Image.network(
                  "https://p4.wallpaperbetter.com/wallpaper/928/757/190/anime-solo-leveling-hd-wallpaper-preview.jpg"),
              pressedImage: Image.network(
                  "https://p4.wallpaperbetter.com/wallpaper/928/757/190/anime-solo-leveling-hd-wallpaper-preview.jpg"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => mmogamespage(),
                    ));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ImageButton(
              height: MediaQuery.of(context).size.height * 0.25,
              children: [
                Text(
                  "Fps Oyunları",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
              unpressedImage: Image.network(
                  "https://www.esquireme.com/public/images/2020/05/31/Borderlands_2_VR_Launch_Shots_Teleport_02-1024x576.jpg"),
              pressedImage: Image.network(
                  "https://www.esquireme.com/public/images/2020/05/31/Borderlands_2_VR_Launch_Shots_Teleport_02-1024x576.jpg"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => fpsgamespage(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
