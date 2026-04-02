import 'package:flutter/material.dart';
import '../../widgets/btNumerico.dart';
import '../../widgets/btOperacao.dart';
import '../../widgets/display.dart';

class CalculadoraPagina extends StatefulWidget {
  const CalculadoraPagina({super.key});

  @override
  State<CalculadoraPagina> createState() => _CalculadoraPaginaState();
}

class _CalculadoraPaginaState extends State<CalculadoraPagina> {
  String valor = '0';
  String expressao = '';
  bool exibindoResultado = false;

  String formatarNumero(double numero) {
    if (numero % 1 == 0) {
      return numero.toInt().toString();
    }
    return numero.toString();
  }

  bool ehOperador(String texto) {
    return texto == '+' || texto == '-' || texto == '*' || texto == '/';
  }

  List<String> normalizarTokens(String valorExpressao) {
    return valorExpressao
        .split(' ')
        .where((token) => token.isNotEmpty)
        .toList();
  }

  double avaliarExpressao(List<String> tokens) {
    final List<String> passoUm = [];
    int i = 0;

    while (i < tokens.length) {
      final String token = tokens[i];

      if (token == '*' || token == '/') {
        final double esquerdo = double.parse(passoUm.removeLast());
        final double direito = double.parse(tokens[i + 1]);

        if (token == '/' && direito == 0) {
          throw Exception('divisao por zero');
        }

        final double parcial = token == '*'
            ? esquerdo * direito
            : esquerdo / direito;
        passoUm.add(parcial.toString());
        i += 2;
        continue;
      }

      passoUm.add(token);
      i++;
    }

    double resultado = double.parse(passoUm[0]);
    i = 1;

    while (i < passoUm.length) {
      final String operador = passoUm[i];
      final double numero = double.parse(passoUm[i + 1]);

      if (operador == '+') {
        resultado += numero;
      } else if (operador == '-') {
        resultado -= numero;
      }

      i += 2;
    }

    return resultado;
  }

  void atualizarDisplay() {
    valor = expressao.isEmpty ? '0' : expressao;
  }

  void clicarBotao(String texto) {
    setState(() {
      if (exibindoResultado) {
        expressao = '';
        exibindoResultado = false;
      }

      final List<String> tokens = normalizarTokens(expressao);
      if (tokens.isNotEmpty && !ehOperador(tokens.last)) {
        tokens[tokens.length - 1] = '${tokens.last}$texto';
      } else {
        tokens.add(texto);
      }

      expressao = tokens.join(' ');
      atualizarDisplay();
    });
  }

  void limpar() {
    setState(() {
      expressao = '';
      atualizarDisplay();
      exibindoResultado = false;
    });
  }

  void definirOperacao(String op) {
    setState(() {
      if (expressao.isEmpty) {
        return;
      }

      final List<String> tokens = normalizarTokens(expressao);
      if (tokens.isEmpty) {
        return;
      }

      if (ehOperador(tokens.last)) {
        tokens[tokens.length - 1] = op;
      } else {
        tokens.add(op);
      }

      expressao = tokens.join(' ');
      exibindoResultado = false;
      atualizarDisplay();
    });
  }

  void calcular() {
    setState(() {
      if (expressao.isEmpty) {
        return;
      }

      final List<String> tokens = normalizarTokens(expressao);
      if (tokens.isEmpty || ehOperador(tokens.last)) {
        return;
      }

      try {
        final double resultado = avaliarExpressao(tokens);
        valor = formatarNumero(resultado);
        expressao = valor;
        exibindoResultado = true;
      } catch (_) {
        valor = 'erro';
        expressao = '';
        exibindoResultado = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double larguraDisponivel = constraints.maxWidth - 32;
            final double alturaDisponivel = constraints.maxHeight - 32;
            final double larguraCard = larguraDisponivel.clamp(300.0, 430.0);
            final double alturaCard = (larguraCard * 0.96).clamp(
              360.0,
              alturaDisponivel,
            );

            return Center(
              child: SizedBox(
                width: larguraCard,
                height: alturaCard,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Display(valor: valor),
                        const SizedBox(height: 6),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    BtNumerico(
                                      texto: '7',
                                      onClick: clicarBotao,
                                    ),
                                    BtNumerico(
                                      texto: '8',
                                      onClick: clicarBotao,
                                    ),
                                    BtNumerico(
                                      texto: '9',
                                      onClick: clicarBotao,
                                    ),
                                    BtOperacao(
                                      texto: '/',
                                      onClick: definirOperacao,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    BtNumerico(
                                      texto: '4',
                                      onClick: clicarBotao,
                                    ),
                                    BtNumerico(
                                      texto: '5',
                                      onClick: clicarBotao,
                                    ),
                                    BtNumerico(
                                      texto: '6',
                                      onClick: clicarBotao,
                                    ),
                                    BtOperacao(
                                      texto: '*',
                                      onClick: definirOperacao,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    BtNumerico(
                                      texto: '1',
                                      onClick: clicarBotao,
                                    ),
                                    BtNumerico(
                                      texto: '2',
                                      onClick: clicarBotao,
                                    ),
                                    BtNumerico(
                                      texto: '3',
                                      onClick: clicarBotao,
                                    ),
                                    BtOperacao(
                                      texto: '-',
                                      onClick: definirOperacao,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    BtNumerico(
                                      texto: '0',
                                      onClick: clicarBotao,
                                    ),
                                    BtOperacao(
                                      texto: 'C',
                                      onClick: (_) => limpar(),
                                    ),
                                    BtOperacao(
                                      texto: '=',
                                      onClick: (_) => calcular(),
                                    ),
                                    BtOperacao(
                                      texto: '+',
                                      onClick: definirOperacao,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
