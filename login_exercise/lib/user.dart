import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: telaUser(),
  ));
}

class telaUser extends StatelessWidget {
  const telaUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Usuário"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 350,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueAccent,
                ),
                child: Text(
                  "Bem-vindo de volta!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            SizedBox(
              width: 290,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Voltar")),
            ),
          ],
        ));
  }
}
