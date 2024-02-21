import 'package:flutter/material.dart';
import 'package:telas_multiplas/main.dart';
import 'package:telas_multiplas/tela3.dart';

class Telasecundaria extends StatelessWidget {
  const Telasecundaria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.redAccent,
            width: 400,
            height: 180,
            child: Text(
              "Tela 2",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 330,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Voltar")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
