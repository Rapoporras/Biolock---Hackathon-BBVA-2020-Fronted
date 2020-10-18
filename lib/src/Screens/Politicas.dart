import 'package:flutter/material.dart';
import 'package:flutter_app/src/Global.dart';

class Politicas extends StatefulWidget {
  @override
  _PoliticasState createState() => _PoliticasState();
}

class _PoliticasState extends State<Politicas> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Política de Privacidad',
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
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Polítca de Privacidad de BBVA",
                  style: TextStyle(fontSize: 16, color: Color(0xFF1464A5)),
                ),
              ),
              Text(
                "Dismember a mouse and then regurgitate parts of it on the family room floor i can haz under the bed, yet do i like standing on litter cuz i sits when i have spaces, my cat buddies have no litter i live in luxury cat life see owner, run in terror need to check on human, have not seen in an hour might be dead oh look, human is alive, hiss at human, feed me for i like to spend my days sleeping and eating fishes that my human fished for me we live on a luxurious yacht, sailing proudly under the sun, i like to walk on the deck, watching the horizon, dreaming of a good bowl of milk. Eat a plant, kill a hand hiding behind the couch until lured out by a feathery toy, cough furball but this human feeds me, i should be a god.",
                style: TextStyle(fontSize: 16, color: Color(0xFF1464A5)),
              ),
              Text(
                "Dismember a mouse and then regurgitate parts of it on the family room floor.",
                style: TextStyle(fontSize: 16, color: Color(0xFF1464A5)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Checkbox(
                      value: this.isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          this.isSwitched = value;
                          politicas = this.isSwitched;
                        });
                      },
                    ),
                    Text(
                      "He leído y acepto el uso de mis datos",
                      style: TextStyle(fontSize: 16, color: Color(0xFF1464A5)),
                    )
                  ],
                ),
              )
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
