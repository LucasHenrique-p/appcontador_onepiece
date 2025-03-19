import 'package:flutter/material.dart';
import 'home.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  LinearGradient _mudarcor = LinearGradient(
    begin: Alignment.topCenter,
    colors: [Colors.green, Colors.blue],
  );

  void _MudarGradiente() {
    setState(() {
      if (_mudarcor.colors[0] == Colors.green) {
        _mudarcor = LinearGradient(
          begin: Alignment.topCenter,
          colors: [Colors.purple, Colors.orange],
        );
      } else {
        _mudarcor = LinearGradient(
          begin: Alignment.topCenter,
          colors: [Colors.green, Colors.blue],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: _mudarcor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Sejam Bem Vindos!!!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 200),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Container(
                height: 80,
                margin: EdgeInsets.symmetric(horizontal: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.pink,
                ),
                child: Center(
                  child: Text(
                    "Acessar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Botão pequeno no canto inferior direito
      floatingActionButton: FloatingActionButton(
        onPressed: _MudarGradiente,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Icon(Icons.color_lens, size: 30),
      ),
    );
  }
}
