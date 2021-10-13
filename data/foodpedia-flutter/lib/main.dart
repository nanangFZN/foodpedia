import 'package:absensi/pages/SplashPage.dart';
import 'package:absensi/pages/bottomnavigation.dart';
import 'package:absensi/pages/details.dart';
import 'package:absensi/pages/login.dart';
import 'package:absensi/pages/menu.dart';
import 'package:absensi/pages/register.dart';
import 'package:absensi/pages/started.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SpalashPage(),
        '/started':(context)=>Started(),
        '/login':(context)=>Login(),
        '/register':(context)=>Register(),
        '/home':(context)=>Home(),
        '/details':(context)=>Detail()
        
      },
    );
  }
}
