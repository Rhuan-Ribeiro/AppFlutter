import 'package:flutter/material.dart';
import 'package:pocketshop/client.dart';
import 'package:pocketshop/admin.dart';

void main() {
  runApp(MaterialApp(
    home: PocketShop(),
  ));
}

TextEditingController _email = TextEditingController();
TextEditingController _pass = TextEditingController();
String emailAdmin = 'admin@mange.com';
String passAdmin = 'admin';
String emailClient = 'client@mange.com';
String passClient = 'client';

enum UserType { client, admin }

class PocketShop extends StatefulWidget {
  const PocketShop({super.key});

  @override
  State<PocketShop> createState() => _PocketShopState();
}

class _PocketShopState extends State<PocketShop> {
  UserType? _user = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("PocketShop"),
      ),
      body: ListView(
        children: [
          Image.asset('assets/illustration.png',
              width: 300, height: 300, fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 28,
                // decoration: TextDecoration.underline,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle:
                        TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                    hintText: 'Digite seu email',
                    suffixIcon: Icon(Icons.email_outlined),
                    suffixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.black
                            : Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  controller: _email,
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                    hintText: 'Digite sua senha',
                    suffixIcon: Icon(Icons.lock_outlined),
                    suffixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.black
                            : Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: _pass,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio<UserType>(
                          activeColor: Colors.red,
                          value: UserType.client,
                          groupValue: _user,
                          onChanged: (UserType? value) {
                            setState(() {
                              _user = value;
                            });
                          },
                        ),
                        Text("Cliente"),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<UserType>(
                          activeColor: Colors.red,
                          value: UserType.admin,
                          groupValue: _user,
                          onChanged: (UserType? value) {
                            setState(() {
                              _user = value;
                            });
                          },
                        ),
                        Text("Admin"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 400,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        print("user: $_user");
                        print("email: ${_email.text}");
                        print("senha: ${_pass.text}");
                        if (_user == UserType.client &&
                            _email.text == emailClient &&
                            _pass.text == passClient) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Client()));
                        } else if (_user == UserType.admin &&
                            _email.text == emailAdmin &&
                            _pass.text == passAdmin) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Admin()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // Background color
                        foregroundColor:
                            Colors.white, // Text Color (Foreground color)
                      ),
                      child: Text("Logar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
