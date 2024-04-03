import 'package:flutter/material.dart';
import 'package:pocketshop/main.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Cadastro de Produtos"),
      ),
      body: ListView(
        children: [
          Text("Teste"),
          // Product("Resistor", "imagens/resistor.jpg", 2),
          // Product("Diodo", "imagens/diodo.jpg", 3),
        ],
      ),
    );
  }
}

class Product extends StatefulWidget {
  final String name;
  final String image;
  final int quant;
  final double price;
  const Product(this.name, this.image, this.quant, this.price, {super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Container(width: double.maxFinite,height: 200,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(width: 196,height: double.maxFinite,child: Image.asset('${widget.img}')),
//                 Container(width: 196,height: double.maxFinite,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text('${widget.nome_item}',style: TextStyle(fontSize: 25,color: Colors.black),),
//                     Text('Preço: R\$ ${widget.valor}',style: TextStyle(fontSize: 15,color: Colors.black),),
//                     Text('Quantidade: ${quantidade}',style: TextStyle(fontSize: 15,color: Colors.black),),
//                     Container(width: double.maxFinite,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton(onPressed: (){
//                           _add_qtd();
//                         }, 