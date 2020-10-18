import 'package:flutter/material.dart';

class Filtros extends StatefulWidget {
  @override
  _FiltrosState createState() => _FiltrosState();
}

class _FiltrosState extends State<Filtros> {
  bool isSwitched = false;
  bool Cuenta = true;
  bool Nomina = false;
  bool DNI = false;
  bool Matricula = true;
  bool Nombre = true;
  bool SS = false;
  bool Hipoteca = false;
  String Cuantia = "300€";
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Expanded(
                        child: Text(
                          "Franja económica nivel superior",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                      Container(
                          width: 80,
                          alignment: Alignment.center,
                          color: Color(0xFF072146),
                          child: Text(
                            Cuantia,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ],
                  ),
                ),
                // onTap: () => {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Politicas()),
                //   )
                // },
              ),
              Container(
                height: 74,
                padding: EdgeInsets.only(left: 10),
                color: Color(0xFF1464A5),
                alignment: Alignment.center,
                child: Text("Datos a compartir de básica seguridad",
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
                        child: _getIcon(Nombre, ""),
                      ),
                      Expanded(
                        child: Text(
                          "Nombre y Apellidos",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    Nombre = !Nombre; // we got a new "droplet"
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
                        child: _getIcon(DNI, ""),
                      ),
                      Expanded(
                        child: Text(
                          "DNI",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    DNI = !DNI; // we got a new "droplet"
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
                        child: _getIcon(Cuenta, ""),
                      ),
                      Expanded(
                        child: Text(
                          "Cuenta bancarioa",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    Cuenta = !Cuenta; // we got a new "droplet"
                  })
                },
              ),
              Container(
                height: 74,
                padding: EdgeInsets.only(left: 10),
                color: Color(0xFF1464A5),
                alignment: Alignment.center,
                child: Text("Datos a compartir de alta seguridad",
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
                        child: _getIcon(Nomina, ""),
                      ),
                      Expanded(
                        child: Text(
                          "Nómina",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    Nomina = !Nomina; // we got a new "droplet"
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
                        child: _getIcon(Matricula, ""),
                      ),
                      Expanded(
                        child: Text(
                          "Matrícula del coche",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    Matricula = !Matricula; // we got a new "droplet"
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
                        child: _getIcon(SS, ""),
                      ),
                      Expanded(
                        child: Text(
                          "Número de la Seguridad Social",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    SS = !SS; // we got a new "droplet"
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
                        child: _getIcon(Hipoteca, ""),
                      ),
                      Expanded(
                        child: Text(
                          "Hipoteca del Hogar",
                          style:
                              TextStyle(color: Color(0xFF1464A5), fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => {
                  setState(() {
                    Hipoteca = !Hipoteca; // we got a new "droplet"
                  })
                },
              ),
            ],
          ),
        ));
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
