import 'package:flutter/material.dart';
import 'package:flutter_app/src/Global.dart';
import 'package:flutter_app/src/Screens/Config.dart';
import 'package:flutter_app/src/Screens/IniConfig.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        child: Stack(alignment: const Alignment(0, 0), children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fondohome.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Text(
                  "¿Qué es?",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                              "BioLock es un identificador facial y dactilar.",
                              style: TextStyle(
                                  color: Color(0xFF1464A5),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                              "Que te facilitará el proceso de compartir datos.",
                              style: TextStyle(
                                  color: Color(0xFF1464A5),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                              "Además generará una mayor protección de tus datos.",
                              style: TextStyle(
                                  color: Color(0xFF1464A5),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w100)),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IniConfig()),
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
