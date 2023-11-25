import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    home: Home(),
  ));
}

// int? cont;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SVAR - Hospedagem"),
      ),
      body: ListView(
        children: [
          Destino('Angra dos Reis', "imagens/angra.jpg", 384, 70),
          Destino('Arraial do Cabo', "imagens/arraial.jpg", 571, 65),
          Destino('Florianopolis', "imagens/florianopolis.jpg", 348, 85),
          Destino('Jericoara', "imagens/jericoara.jpg", 571, 75),
          Destino('Chile', "imagens/chile.jpg", 446, 95),
          Destino('Madrid', "imagens/madrid.jpg", 401, 85),
          Destino('Paris', "imagens/paris.jpg", 546, 95),
          Destino('Roma', "imagens/roma.jpg", 478, 85),
          Destino('Orlando', "imagens/orlando.jpg", 616, 105),
          Destino('Las Vegas', "imagens/lasvegas.jpg", 504, 110),
        ],
      ),
    );
  }
}

class Destino extends StatefulWidget {
  final String nome;
  final String img;
  final double valord;
  final double valorp;

  const Destino(this.nome, this.img, this.valord, this.valorp, {super.key});

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino> {
  int n_pessoas = 0;
  int n_dias = 0;
  double total = 0;

  //////////////////////////////////////

  void dias() {
    setState(() {
      n_dias++;
      calctotal();
    });
  }

  void sub_dias() {
    setState(() {
      if (n_dias != 0) {
        n_dias = n_dias - 1;
        calctotal();
      }
    });
  }

  void pessoas() {
    setState(() {
      n_pessoas++;
      calctotal();
    });
  }

  void sub_pessoas() {
    setState(() {
      if (n_pessoas != 0) {
        n_pessoas = n_pessoas - 1;
        calctotal();
      }
      ;
    });
  }

  void limpar() {
    setState(() {
      n_dias = 0;
      n_pessoas = 0;
      // calctotal();
      calctotal();
    });
  }

  void calctotal() {
    setState(() {
      total = (n_dias * widget.valord) + (n_pessoas * widget.valorp);
    });
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: Size(30, 10),
    padding: EdgeInsets.symmetric(horizontal: 2),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  ///////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            width: 393,
            height: 250,
            child: Image.asset(widget.img, fit: BoxFit.fill),
          ),
          Text(
            widget.nome,
            style: TextStyle(fontSize: 30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "R\$ ${widget.valord}/dia - R\$ ${widget.valorp}/pessoa",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Qtd. de Pessoas:",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () {
                            sub_pessoas();
                          },
                          child: Icon(Icons.remove)),
                      Text(
                        "$n_pessoas",
                        style: TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () {
                            pessoas();
                          },
                          child: Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Qtd. de Dias:",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () {
                            sub_dias();
                          },
                          child: Icon(Icons.remove)),
                      Text(
                        "$n_dias",
                        style: TextStyle(fontSize: 18),
                      ),
                      ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () {
                            dias();
                          },
                          child: Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Valor Total: R\$ ${total.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: () {
                    limpar();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
