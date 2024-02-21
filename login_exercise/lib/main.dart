import 'package:flutter/material.dart';
import 'package:login_exercise/user.dart';

void main() {
  runApp(MaterialApp(
    home: telaLogin(),
  ));
}

TextEditingController _user = TextEditingController();
TextEditingController _pass = TextEditingController();
String emailAdmin = 'admin@senai.com';
String passAdmin = '000';

class telaLogin extends StatelessWidget {
  const telaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Login",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 50),
            ),
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
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          InputDecoration(labelText: "Digite seu email"),
                      controller: _user,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: "Digite sua senha"),
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: _pass,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 290,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    print(_user.text);
                    print(_pass.text);
                    print(_user);
                    print(_pass);
                    print(emailAdmin);
                    print(passAdmin);

                    if (_user.text == emailAdmin && _pass.text == passAdmin) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => telaUser()));
                    }
                  },
                  child: Text("Entrar")),
            ),
          ],
        ));
  }
}
