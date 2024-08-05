// lib/main.dart
import 'package:flutter/material.dart';
import 'jogo.dart'; // Importa a classe Jogo

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo da Forca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ForcaPage(),
    );
  }
}

class ForcaPage extends StatefulWidget {
  @override
  _ForcaPageState createState() => _ForcaPageState();
}

class _ForcaPageState extends State<ForcaPage> {
  late Jogo jogo;
  int erros = 0;
  List<String> letrasAcionadas = [];

  void acionarLetra(String letra) {
    if (!letrasAcionadas.contains(letra)) {
      letrasAcionadas.add(letra);
    }
  }

  @override
  void initState() {
    super.initState();
    jogo = Jogo();
  }

  void _onLetterPressed(String letra) {
    setState(() {
      String resultado = jogo.jogar(context, letra);
      if (resultado.startsWith('Letra não encontrada')) {
        erros++;
      }
    });
  }

  Widget _desenhoForca() {
    return Column(
      children: [
        Text(
          'Erros: $erros',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Text(
          'Letras já acionadas:',
          
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          
        ),
        Text(
          letrasAcionadas.join(', ').toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 30),
        _desenharCabeca(),
        _desenharCorpoEBracos(), // Modificação aqui
        _desenharPernas(),
      ],
    );
  }

  Widget _desenharCabeca() {
    return erros > 0
        ? const CircleAvatar(
            radius: 20,
          )
        : Container();
  }

  // Novo método que combina o corpo e os braços
  Widget _desenharCorpoEBracos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Braço esquerdo
        _desenharBracoEsquerdo(),
        // Corpo
        _desenharCorpo(),
        // Braço direito
        _desenharBracoDireito(),
      ],
    );
  }

  Widget _desenharCorpo() {
    return erros > 1
        ? Container(height: 50, width: 5, color: Colors.black)
        : Container();
  }

  Widget _desenharBracoEsquerdo() {
    return erros > 2
        ? Container(height: 5, width: 30, color: Colors.black)
        : Container();
  }

  Widget _desenharBracoDireito() {
    return erros > 2
        ? Container(height: 5, width: 30, color: Colors.black)
        : Container();
  }

  Widget _desenharPernas() {
    return erros > 3
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 30, width: 5, color: Colors.black),
              const SizedBox(width: 10),
              Container(height: 30, width: 5, color: Colors.black),
            ],
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 90,
          ),
          Text(
            jogo.palavraEscondida.toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          _desenhoForca(),
          const SizedBox(height: 50),
          const Spacer(), // Empurra os elementos acima para o topo
          Wrap(
            spacing: 10,
            children: 'abcdefghijklmnopqrstuvwxyz'.split('').map((letra) {
              return ElevatedButton(
                onPressed: () {
                  acionarLetra(letra);
                  return _onLetterPressed(letra);
                }, //_onLetterPressed(letra),
                child: Text(
                  letra.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20), // Adiciona um espaço abaixo das letras
        ],
      ),
    );
  }
}
