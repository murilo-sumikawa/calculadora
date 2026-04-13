import 'package:flutter/material.dart';

import '../widgets/btNumerico.dart';
import '../widgets/btOperacao.dart';

// monta a grade de botões da calculadora
class Teclado extends StatelessWidget {
  final ValueChanged<String> onNumero;
  final ValueChanged<String> onAcao;
  final VoidCallback onLimpar;
  final VoidCallback onCalcular;

  const Teclado({
    super.key,
    required this.onNumero,
    required this.onAcao,
    required this.onLimpar,
    required this.onCalcular,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                BotaoNumero(texto: '7', onClick: onNumero),
                BotaoNumero(texto: '8', onClick: onNumero),
                BotaoNumero(texto: '9', onClick: onNumero),
                BotaoAcao(texto: '/', onClick: onAcao),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BotaoNumero(texto: '4', onClick: onNumero),
                BotaoNumero(texto: '5', onClick: onNumero),
                BotaoNumero(texto: '6', onClick: onNumero),
                BotaoAcao(texto: '*', onClick: onAcao),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BotaoNumero(texto: '1', onClick: onNumero),
                BotaoNumero(texto: '2', onClick: onNumero),
                BotaoNumero(texto: '3', onClick: onNumero),
                BotaoAcao(texto: '-', onClick: onAcao),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BotaoNumero(texto: '0', onClick: onNumero),
                BotaoAcao(texto: 'C', onClick: (_) => onLimpar()),
                BotaoAcao(texto: '=', onClick: (_) => onCalcular()),
                BotaoAcao(texto: '+', onClick: onAcao),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
