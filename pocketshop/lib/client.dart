import 'package:flutter/material.dart';
import 'package:pocketshop/main.dart';

class Client extends StatefulWidget {
  const Client({super.key});

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Compras"),
      ),
      body: ListView(
        children: [
          Text("Tela do Cliente"),
        ],
      ),
    );
  }
}
