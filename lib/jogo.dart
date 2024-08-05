import 'dart:math';

import 'package:flutter/material.dart';

class Jogo {
  final List<String> _palavras = [
    'python',
    'programacao',
    'computador',
    'aula',
    'variavel'
  ];

  late String _palavraSorteada;
  late String _palavraEscondida;
  List<String> _letrasAdivinhadas = [];
  late int _maxTentativas;

  Jogo() {
    _inicializarJogo();
  }

  void _inicializarJogo() {
    _palavraSorteada = _sortearPalavra();
    _palavraEscondida = '*' * _palavraSorteada.length;
    _letrasAdivinhadas.clear();
    _maxTentativas = 4;
  }

  String _sortearPalavra() {
    final random = Random();
    return _palavras[random.nextInt(_palavras.length)];
  }

  String get palavraEscondida => _palavraEscondida;
  int get maxTentativas => _maxTentativas;

  String jogar(BuildContext context, String letra) {
    if (_letrasAdivinhadas.contains(letra)) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  'Você já digitou essa letra. Tente outra por favor.'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'))
              ],
            );
          });
      return 'Você já digitou essa letra. Tente outra por favor.';
    }

    _letrasAdivinhadas.add(letra);

    if (_palavraSorteada.contains(letra)) {
      _atualizarPalavraEscondida(letra);
    } else {
      _maxTentativas--;
      if (_maxTentativas == 0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    'Você perdeu. A palavra era $_palavraSorteada.'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Fechar'))
                ],
              );
            });
        return 'Você perdeu. A palavra era $_palavraSorteada.';
      }
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  'Letra não encontrada. Você tem mais $_maxTentativas tentativas.'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'))
              ],
            );
          });
      return 'Letra não encontrada. Você tem mais $_maxTentativas tentativas.';
    }

    if (_palavraEscondida == _palavraSorteada) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  'Parabéns, Você ganhou!! A palavra era $_palavraSorteada.'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'))
              ],
            );
          });
      return 'Parabéns, Você ganhou!! A palavra era $_palavraSorteada.';
    }
    return _palavraEscondida;
  }

  void _atualizarPalavraEscondida(String letra) {
    List<String> lista = List<String>.filled(_palavraSorteada.length, '');
    for (int i = 0; i < _palavraSorteada.length; i++) {
      if (_palavraSorteada[i] == letra) {
        lista[i] = letra;
      } else {
        lista[i] = _palavraEscondida[i];
      }
    }
    _palavraEscondida = lista.join('');
  }
}
