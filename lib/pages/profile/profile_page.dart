import 'package:descovir/pages/profile/graphic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    User user = FirebaseAuth.instance.currentUser;
    return Container(
      width: screensize.width,
      height: screensize.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(user.photoURL),
            ),
            Text(user.displayName),
            Text(user.email),
            Text(user.uid),
            Text(user.phoneNumber ?? "Telefon numarası yok"),
            IconButton(
              icon: const Icon(Icons.graphic_eq_rounded),
              tooltip: 'Grafiğe geç',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LineChartSample2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
