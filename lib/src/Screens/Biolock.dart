import 'package:flutter/material.dart';
import 'package:flutter_app/src/Global.dart';
import 'package:flutter_app/src/Screens/Config.dart';
import 'package:flutter_app/src/Screens/Identificacion.dart';
import 'package:flutter_app/src/Screens/IniConfig.dart';
import 'package:local_auth/auth_strings.dart';

import 'package:local_auth/local_auth.dart';

class Biolock extends StatefulWidget {
  @override
  _BiolockState createState() => _BiolockState();
}

class _BiolockState extends State<Biolock> {
  bool isSwitched = false;
  bool isAuth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Biolock',
            style: TextStyle(fontSize: 27),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF072146),
          leading: IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Config()),
            ),
          ),
        ),
        body: Container(
            child: Column(
          children: [
            Container(
              height: 74,
              // margin: EdgeInsets.only(top: 15, bottom: 15),
              // color: Color(0xFF1464A5),
              alignment: Alignment.center,
              child: Text("Identificaciones",
                  style: TextStyle(
                      color: Color(0xFF1464A5),
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 74,
              padding: EdgeInsets.only(left: 10),
              color: Color(0xFF1464A5),
              alignment: Alignment.center,
              child: Text("Identificaciones Pendientes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              child: Container(
                height: 74,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF707070)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF707070)),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: _getIcon(false, ""),
                    ),
                    Expanded(
                      child: Text(
                        "Halcon Viajes - Tour Francia",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Color(0xFF072146),
                      child: Text(
                        "150€",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => {_goIdentificacion()},
            ),
            InkWell(
              child: Container(
                height: 74,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF707070)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF707070)),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: _getIcon(false, ""),
                    ),
                    Expanded(
                      child: Text(
                        "Uber - Solicitud Coche ",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Color(0xFF072146),
                      child: Text(
                        "6€",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => {_goIdentificacion()},
            ),
            InkWell(
              child: Container(
                height: 74,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF707070)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF707070)),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: _getIcon(false, ""),
                    ),
                    Expanded(
                      child: Text(
                        "Corte Ingles - Entradas Teatro",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Color(0xFF072146),
                      child: Text(
                        "25€",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => {_goIdentificacion()},
            ),
            Container(
              height: 74,
              padding: EdgeInsets.only(left: 10),
              color: Color(0xFF1464A5),
              alignment: Alignment.center,
              child: Text("Identificaciones Realizadas",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              child: Container(
                height: 74,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF707070)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF707070)),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: _getIcon(true, ""),
                    ),
                    Expanded(
                      child: Text(
                        "Ford España - Ford Focus Seminuevo 1.6 TDi",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Color(0xFF072146),
                      child: Text(
                        "3500€",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => {
                setState(() {
                  _showDialog();
                })
              },
            ),
            InkWell(
              child: Container(
                height: 74,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF707070)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF707070)),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: _getIcon(true, ""),
                    ),
                    Expanded(
                      child: Text(
                        "Amazon - PS5",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      color: Color(0xFF072146),
                      child: Text(
                        "450€",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => {
                setState(() {
                  _showDialog();
                })
              },
            )
          ],
        )));
  }

  void _goIdentificacion() {
    _checkBiometric();

    // if (isAuth == true) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => Identificacion()),
    //   );
    // }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Identificacion Realizada"),
          content: new Text(
              "La Identificación ya se realizó con éxito para mas información póngase en contacto con nuestro servicio de atención al cliente"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _checkBiometric() async {
    // check for biometric availability
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      print("error biome trics $e");
    }

    print("biometric is available: $canCheckBiometrics");

    // enumerate biometric technologies
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      print("error enumerate biometrics $e");
    }

    print("following biometrics are available");
    if (availableBiometrics.isNotEmpty) {
      availableBiometrics.forEach((ab) {
        print("\ttech: $ab");
      });
    } else {
      print("no biometrics are available");
    }

    // authenticate with biometrics
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Pon tu dedo en el sensor para avanzar',
          useErrorDialogs: true,
          stickyAuth: false,
          androidAuthStrings:
              AndroidAuthMessages(signInTitle: "Identificación Dactilar"));
    } catch (e) {
      print("error using biometric auth: $e");
    }
    if (authenticated == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Identificacion()),
      );
    }

    print("authenticated: $authenticated");
  }

  Widget _getIcon(isAuth, number) {
    if (isAuth == false)
      return Stack(
        alignment: const Alignment(0, 0),
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF1464A5),
            radius: 20,
          ),
          Icon(
            Icons.camera_front,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      );
    else {
      return Stack(
        alignment: const Alignment(0, 0),
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFF8CD50),
            radius: 20,
          ),
          Icon(
            Icons.file_download_done,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      );
    }
  }
}
