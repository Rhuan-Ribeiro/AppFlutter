import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(), // home chama tela principal com a classe stateless home
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Criar Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de componentes Compra"),
      ),
      body: ListView(
        children: [
          Componente("Resistor", "imagens/resistor.jpg", 2),
          Componente("Diodo", "imagens/diodo.jpg", 3),
        ],
      ),
    );
  }
}

class Componente extends StatefulWidget {
  final String
      nomecomponente; // cria variaveis para passar o nome do componente
  final String img;
  final int valor; // cria variavel para passar o caminho da imagem
  Componente(this.nomecomponente, this.img, this.valor,
      {super.key}); // construtor para passagem de parâmetros

  @override
  State<Componente> createState() => _Componente();
}

class _Componente extends State<Componente> {
  int cont = 0;
  int total = 0;
  void _increment_counter() {
    // função set state monitora o estado das variáveis da classe statefull
    setState(() {
      cont++;
    });
  }

  void _calc() {
    setState(() {
      total = cont * widget.valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blue,
          width: 300,
          height: 300,
          child: Image.asset(
            widget
                .img, // utiliza o widget para chamar a variavel img pois ela esta fora dessa classe
            fit: BoxFit.fill, // ajuste da imagem no container
          ),
        ),
        Text(
          "${widget.nomecomponente}",
          style: TextStyle(fontSize: 30),
        ),
        Container(
          color: Colors.red,
          width: 200,
          height: 200,
          // child cria relação do container com o texto
          child: Text(
            "$cont" + "Valor total $total",
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  print("Botão pressionado");
                },
                child: Text("Mensagem")),
            ElevatedButton(
                onPressed: _increment_counter, child: Icon(Icons.add)),
            ElevatedButton(
              onPressed: _calc,
              child: Text("Calcular"),
            )
          ],
        ),
      ],
    );
  }
}
