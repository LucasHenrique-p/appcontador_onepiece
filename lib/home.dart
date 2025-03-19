import 'package:flutter/material.dart';
import 'welcome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HometState createState() => _HometState();
}

class _HometState extends State<Home> {
  int _pessoas = 0;
  int _disp = 20;
  String _situacao = "Há Vagas";

  int _imageIndex = 0;

  final List<String> _images = [
    'imagens/onepiece03.jpg',
    'imagens/onepiece02.jpg',
    'imagens/onepiece01.png',
    'imagens/one_piece.jpg',
  ];

  void _mudaPessoas(int valor) {
    setState(() {
      _pessoas += valor;
      if (_pessoas == _disp) {
        _situacao = "Lotado";
      } else {
        _situacao = "Há Vagas";
      }
    });
  }

  void _changeImage() {
    setState(() {
      _imageIndex = (_imageIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voltar"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          },
        ),
        actions: [IconButton(icon: Icon(Icons.image), onPressed: _changeImage)],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(_images[_imageIndex]),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Disponibilidade: $_situacao",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 500),
            Text(
              "Quantidade de Tripulantes: $_pessoas",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 161, 204, 162),
                    shadowColor: Colors.green,
                    elevation: 3,
                    side: const BorderSide(color: Colors.green),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onPressed:
                      (_pessoas < _disp)
                          ? () {
                            _mudaPessoas(1);
                          }
                          : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 209, 99, 99),
                    shadowColor: Colors.red,
                    elevation: 3,
                    side: const BorderSide(color: Colors.red),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onPressed:
                      (_pessoas > 0)
                          ? () {
                            _mudaPessoas(-1);
                          }
                          : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "1",
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
