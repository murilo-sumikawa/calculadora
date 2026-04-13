import 'package:flutter/material.dart';

import '../components/card.dart';
import '../components/controller.dart';

// pagina que liga estado e interface
class CalculadoraPagina extends StatefulWidget {
  const CalculadoraPagina({super.key});

  @override
  State<CalculadoraPagina> createState() => _CalculadoraPaginaState();
}

class _CalculadoraPaginaState extends State<CalculadoraPagina> {
  final Controller ctrl = Controller();

  // envia o numero para o controller
  void tocarNumero(String numero) {
    setState(() {
      ctrl.addNumero(numero);
    });
  }

  // limpa a conta atual
  void limparTela() {
    setState(() {
      ctrl.limpar();
    });
  }

  // adiciona a operacao escolhida
  void tocarAcao(String acao) {
    setState(() {
      ctrl.addAcao(acao);
    });
  }

  // calcula o valor final da conta
  void fecharConta() {
    setState(() {
      ctrl.calcular();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardCalc(
        valor: ctrl.valor,
        onNumero: tocarNumero,
        onAcao: tocarAcao,
        onLimpar: limparTela,
        onCalcular: fecharConta,
      ),
    );
  }
}
