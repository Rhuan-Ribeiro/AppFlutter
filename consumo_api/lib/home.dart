import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'app_text_style.dart' as styles;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

TextEditingController _cep = TextEditingController();
String? logradouro;
String? bairro;
String? cidade;
String? estado;
String? ddd;
int? statusCode;

@override
class _HomeState extends State<Home> {
  @override
  _consultaCep() async {
    print("cep: ${_cep.text}");
    String url = 'https://cep.awesomeapi.com.br/json/${_cep.text}';
    // api para consultar o endereço através do CEP
    http.Response response; // variavel para armazenar a resposta da API
    response =
        await http.get(Uri.parse(url)); // response armazena resposta da API
    statusCode = response.statusCode;
    print("Código de status da API: $statusCode");
    if (statusCode == 200) {
      print("Resposta da API: ${response.body}");

      Map<String, dynamic> dados =
          json.decode(response.body); // variavel para armazenar os dados
      setState(() {
        statusCode;
        logradouro = dados["address"];
        bairro = dados["district"];
        cidade = dados["city"];
        estado = dados["state"];
        ddd = dados["ddd"];
      });

      print("Logradouro: $logradouro");
      print("Bairro: $bairro");
      print("Cidade: $cidade");
      print("Estado: $estado");
      print("DDD: $ddd");
    } else {
      print("Requisição inválida");
      setState(() {
        statusCode;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o seu CEP"),
              controller: _cep,
            ),
            ElevatedButton(onPressed: _consultaCep, child: Text("Consultar")),
            Center(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${statusCode == 200 ? "${logradouro} , ${bairro}" : ""}",
                          style: styles.AppTextStyle.body,
                        ),
                        Text(
                          "${statusCode == 200 ? "${cidade} , ${estado}" : ""}",
                          style: styles.AppTextStyle.body,
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
