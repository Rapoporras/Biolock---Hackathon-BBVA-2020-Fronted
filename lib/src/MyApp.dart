import 'package:flutter/material.dart';
import 'package:flutter_app/src/Screens/Config.dart';
import 'package:flutter_app/src/Screens/home.dart';
import 'package:flutter_app/src/navbar.dart';

import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: Navbar(),
      home: Home(),
    );
  }
}
