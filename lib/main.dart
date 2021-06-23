import 'package:descovir/pages/loading/discovir_loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'Discovir',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                  primaryColor: Colors.green,
                  accentColor: Colors.green,
                  scaffoldBackgroundColor: Colors.white),
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.system,
              home: LoadingPage());
        } else if (snapshot.connectionState == ConnectionState.none) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Veritabanı hatası"),
              ),
            ),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator(color: Colors.red)),
            ),
          );
        }
      },
    );
  }
}
