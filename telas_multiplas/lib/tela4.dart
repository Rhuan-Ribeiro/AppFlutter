import 'package:flutter/material.dart';

class telacontador extends StatefulWidget {
  const telacontador({super.key});

  @override
  State<telacontador> createState() => telacontadorState();
}

int cont = 0;

class telacontadorState extends State<telacontador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 350,
            height: 180,
            child: Center(
              child: Text(
                "Contagem: " + "$cont",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // set state atualiza o valor da variavel com base no estado
                    setState(() {
                      cont++;
                    });
                  },
                  child: Icon(Icons.add)), // adiciona o icone no botão("+")
              ElevatedButton(
                  onPressed: () {
                    // set state atualiza o valor da variavel com base no estado
                    setState(() {
                      if (cont > 0) {
                        cont--;
                      }
                    });
                  },
                  child: Icon(Icons.remove)), // adiciona o icone no botão("-")
              ElevatedButton(
                  onPressed: () {
                    // set state atualiza o valor da variavel com base no estado
                    setState(() {
                      cont = 0;
                    });
                  },
                  child: Icon(Icons.delete)),
            ],
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
      ),
    );
  }
}
