import 'package:flutter/material.dart';
import 'package:flutter_app/src/Global.dart';
import 'package:flutter_app/src/Screens/Config.dart';
import 'package:flutter_app/src/Screens/Info.dart';

class IniConfig extends StatefulWidget {
  @override
  _IniConfigState createState() => _IniConfigState();
}

class _IniConfigState extends State<IniConfig> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inicio Configuración',
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
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                "Siga los pasos",
                style: TextStyle(color: Color(0xFF1464A5), fontSize: 35),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  "Y rellene los datos requeridos en el orden que aparece señalizado",
                  style: TextStyle(
                      color: Color(0xFF1464A5),
                      fontSize: 24,
                      fontWeight: FontWeight.w100),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/pasos.png"),
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
            MaterialPageRoute(builder: (context) => Config()),
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
