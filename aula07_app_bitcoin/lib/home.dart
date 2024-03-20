import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; // importa o pacote http para consumo da api
import 'dart:convert'; // metodo para converter dado json

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? baseSelect;
  int? convertSelect;
  TextEditingController valorOriginal = TextEditingController();
  String? _precobit = "0.00"; // variavel para armazenar o valor do bitcoin
  double bid = 0;
  double? conversaoTotal = 0.00;
  String moeda = "";
  // async é porque a função vai esperar uma resposta da api pelo metodo http.get
  _consultaprecoBitCoin() async {
    String url = "https://blockchain.info/ticker"; // url com a api
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> dados =
        json.decode(response.body); // decodifica a informação
    //vinda da api
    print(
        "Codigo de status da resposta da api ${response.statusCode.toString()}");
    setState(() {
      _precobit = dados["BRL"]["buy"].toString();
    });

    print(_precobit);
  }

  _conversorMoedas() async {
    String url =
        "https://economia.awesomeapi.com.br/json/last/BRL-USD,BRL-EUR,USD-EUR"; // url com a api
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> dados =
        json.decode(response.body); // decodifica a informação
    //vinda da api
    print(
        "Codigo de status da resposta da api ${response.statusCode.toString()}");
    String brlusd = dados["BRLUSD"]["bid"].toString();
    String brleur = dados["BRLEUR"]["bid"].toString();
    String usdbrl = (1 / double.parse(brlusd)).toString();
    String usdeur = dados["USDEUR"]["bid"].toString();
    String eurbrl = (1 / double.parse(brleur)).toString();
    String eurusd = (1 / double.parse(usdeur)).toString();

    if (baseSelect == convertSelect) {
      bid = 1;
    } else if (baseSelect == 0 && convertSelect == 1) {
      bid = double.parse(brlusd);
    } else if (baseSelect == 0 && convertSelect == 2) {
      bid = double.parse(brleur);
    } else if (baseSelect == 1 && convertSelect == 0) {
      bid = double.parse(usdbrl);
    } else if (baseSelect == 1 && convertSelect == 2) {
      bid = double.parse(usdeur);
    } else if (baseSelect == 2 && convertSelect == 0) {
      bid = double.parse(eurbrl);
    } else if (baseSelect == 2 && convertSelect == 1) {
      bid = double.parse(eurusd);
    }

    if (convertSelect == 1) {
      moeda = "\$";
    } else if (convertSelect == 2) {
      moeda = "€";
    } else {
      moeda = "R\$";
    }

    setState(() {
      conversaoTotal = double.parse(valorOriginal.text) * bid;
    });

    print(valorOriginal);
    print(conversaoTotal);
  }

  _limpar() async {
    setState(() {
      _precobit = "0.00";
      valorOriginal.text = "";
      baseSelect = null;
      convertSelect = null;
      conversaoTotal = 0.00;
      moeda = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor de moedas "),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  bottomLeft:
                      Radius.circular(20.0), // Raio de canto inferior esquerdo
                  bottomRight:
                      Radius.circular(20.0), // Raio de canto inferior direito
                ), // Aqui você define o raio do border
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset("imagens/bitcoin.png"),
                    SizedBox(
                        height:
                            10), // Adicionando um espaçamento entre a imagem e o texto
                    Text(
                      "Valor do BitCoin: R\$ ${_precobit}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign:
                          TextAlign.center, // Alinhando o texto ao centro
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 300,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Conversão Total: $moeda $conversaoTotal",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              style: TextStyle(color: Colors.orange),
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(labelText: "Digite o Valor", textStyle: ),
                              controller: valorOriginal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Moeda Base"),
                              Text("Moeda Convertida"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Radio(
                                  value: 0,
                                  groupValue: baseSelect,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {
                                    setState(() {
                                      baseSelect = value;
                                    });
                                  }),
                              Text("Real"),
                              Radio(
                                  value: 0,
                                  groupValue: convertSelect,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {
                                    setState(() {
                                      convertSelect = value;
                                    });
                                  }),
                              Text("Real"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: baseSelect,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {
                                    setState(() {
                                      baseSelect = value;
                                    });
                                  }),
                              Text("Dolar"),
                              Radio(
                                  value: 1,
                                  groupValue: convertSelect,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {
                                    setState(() {
                                      convertSelect = value;
                                    });
                                  }),
                              Text("Dolar"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: baseSelect,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {
                                    setState(() {
                                      baseSelect = value;
                                    });
                                  }),
                              Text("Euro"),
                              Radio(
                                  value: 2,
                                  groupValue: convertSelect,
                                  activeColor: Colors.orange,
                                  onChanged: (value) {
                                    setState(() {
                                      convertSelect = value;
                                    });
                                  }),
                              Text("Euro"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: _consultaprecoBitCoin,
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black, // Background color
                                    onPrimary: Colors
                                        .amber, // Text Color (Foreground color)
                                  ),
                                  child: Text("Verificar")),
                              ElevatedButton(
                                  onPressed: () => _conversorMoedas(),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black, // Background color
                                    onPrimary: Colors
                                        .amber, // Text Color (Foreground color)
                                  ),
                                  child: Text("Calcular")),
                              ElevatedButton(
                                  onPressed: () => _limpar(),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black, // Background color
                                    onPrimary: Colors
                                        .amber, // Text Color (Foreground color)
                                  ),
                                  child: Text("Limpar")),
                            ],
                          ),
                        ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
