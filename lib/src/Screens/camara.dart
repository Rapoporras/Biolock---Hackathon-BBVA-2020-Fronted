import 'package:flutter/material.dart';
import 'package:flutter_app/src/Screens/Biolock.dart';
import 'package:flutter_app/src/Screens/Politicas.dart';
import 'package:flutter_app/src/Screens/filtros.dart';
import 'package:flutter_app/src/Screens/huellas.dart';
import 'package:local_auth/auth_strings.dart';

import 'package:local_auth/local_auth.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  // bool isSwitched = false;
  bool isAuth = false;
  bool politicas = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Requisitos',
            style: TextStyle(fontSize: 27),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF072146),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
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
                      child: _getIcon(politicas, "1"),
                    ),
                    Expanded(
                      child: Text(
                        "Política de privacidad",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Switch(
                        value: this.politicas,
                        onChanged: (value) {
                          setState(() {
                            this.politicas = value;
                            print(politicas);
                          });
                        },
                        activeTrackColor: Color(0xFF1464A5),
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {
                setState(() {
                  this.politicas = _showDialogpoiticas(politicas);
                  print(politicas);
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
                      child: _getIcon(false, "2"),
                    ),
                    Expanded(
                      child: Text(
                        "Reconocimiento Facial",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {},
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
                      child: _getIcon(isAuth, "3"),
                    ),
                    Expanded(
                      child: Text(
                        "Reconomiento Dactilar",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {
                if (isAuth == true) {_showDialog()} else {_checkBiometric()}
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
                      child: _getIcon(false, "4"),
                    ),
                    Expanded(
                      child: Text(
                        "Seguridad",
                        style:
                            TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Filtros()),
                )
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Biolock()),
            );
          },
          label: Text("Inicio",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, color: Color(0xFF1464A5))),
          icon: Icon(
            Icons.navigate_next,
            color: Color(0xFF1464A5),
          ),
          backgroundColor: Color(0xFFF8CD50),
        ));
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Identificacion Correcta"),
          content: new Text("La Identificacion dactilar es correcta"),
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

  bool _showDialogpoiticas(flag) {
    // flutter defined function
    if (flag == false) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Políticas de Privacidad"),
            content: new Text(
                "Dismember a mouse and then regurgitate parts of it on the family room floor i can haz under the bed, yet do i like standing on litter cuz i sits when i have spaces, my cat buddies have no litter i live in luxury cat life see owner, run in terror need to check on human, have not seen in an hour might be dead oh look, human is alive, hiss at human, feed me for i like to spend my days sleeping and eating fishes that my human fished for me we live on a luxurious yacht, sailing proudly under the sun, i like to walk on the deck, watching the horizon, dreaming of a good bowl of milk. Eat a plant, kill a hand hiding behind the couch until lured out by a feathery toy, cough furball but this human feeds me, i should be a god."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Acepto las políticas de privacidad"),
                onPressed: () {
                  flag = true;
                  print("object");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Políticas de Privacidad"),
            content:
                new Text("Las politicas de privacidad ya fueron aceptadas"),
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
    return flag;
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
          localizedReason: 'Touch your finger on the sensor to login',
          useErrorDialogs: true,
          stickyAuth: false,
          androidAuthStrings:
              AndroidAuthMessages(signInTitle: "Login to HomePage"));
    } catch (e) {
      print("error using biometric auth: $e");
    }
    setState(() {
      isAuth = authenticated ? true : false;
    });

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
          Text(
            number,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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
            Icons.check_rounded,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      );
    }
  }
}
