import 'package:flutter/material.dart';
import 'package:telas_multiplas/main.dart';
import 'package:telas_multiplas/tela2.dart';
import 'package:telas_multiplas/tela4.dart';

class Telaop extends StatelessWidget {
  const Telaop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Opções"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.greenAccent,
            width: 400,
            height: 180,
            child: Text(
              "Tela 3",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Voltar")),
            ],
          ),
        ],
      ),
    );
  }
}
