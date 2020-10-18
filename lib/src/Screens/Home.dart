import 'package:flutter/material.dart';
import 'package:flutter_app/src/Global.dart';
import 'package:flutter_app/src/Screens/Info.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novedades',
          style: TextStyle(fontSize: 27),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF072146),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                "BIOLOCK BBVA",
                style: TextStyle(color: Color(0xFF1464A5), fontSize: 35),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Tu identificador de confianza",
                  style: TextStyle(color: Color(0xFF1464A5), fontSize: 18),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/candado.gif"),
                      fit: BoxFit.cover,
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Info()),
          );
        },
        label: Text("SIGUIENTE",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, color: Color(0xFF1464A5))),
        icon: Icon(
          Icons.navigate_next,
          color: Color(0xFF1464A5),
        ),
        backgroundColor: Color(0xFFF8CD50),
      ),
    );
  }
}
