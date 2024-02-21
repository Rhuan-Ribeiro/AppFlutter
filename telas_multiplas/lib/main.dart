import 'package:flutter/material.dart';
import 'package:telas_multiplas/tela2.dart';
import 'package:telas_multiplas/tela3.dart';
import 'package:telas_multiplas/tela4.dart';
import 'package:telas_multiplas/tela5.dart';

void main() {
  // runApp função que constroi a tela do app
  // MaterialApp função do widget para android
  // home parametro inicial para chamar a tela
  runApp(MaterialApp(
    home: Telaprincipal(),
  ));
}

class Telaprincipal extends StatelessWidget {
  const Telaprincipal({super.key});

  @override
  // COnstroi a tela do aplicativo
  Widget build(BuildContext context) {
    // Scaffold layout semipronto para criar o aplicativo
    return Scaffold(
      // app bar é a barra do aplicativo
      appBar: AppBar(
        title: Text("Aula 03"),
      ),
      // body é o corpo do Scaffold
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // children estabelce relação com os demais widgets com a coluna
        children: [
          Container(
              color: Colors.blueAccent,
              width: 400,
              height: 180,
              child: Text(
                "Tela 1",
                style: TextStyle(fontSize: 25),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push permite chamar a tela 2 e MaterialPageRoute chama a tela seguinte
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Telasecundaria()));
                  },
                  child: Text("Tela 2")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Telaop()));
                  },
                  child: Text("Tela 3")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => telacontador()));
                  },
                  child: Text("Contador")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => campotexto()));
                  },
                  child: Text("Text Field")),
            ],
          ),
        ],
      ),
    );
  }
}
