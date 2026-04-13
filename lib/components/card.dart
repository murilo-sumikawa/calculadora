import 'package:flutter/material.dart';

import '../widgets/display.dart';
import 'teclado.dart';

// junta visor e teclado dentro do card
class CardCalc extends StatelessWidget {
  final String valor;
  final ValueChanged<String> onNumero;
  final ValueChanged<String> onAcao;
  final VoidCallback onLimpar;
  final VoidCallback onCalcular;

  const CardCalc({
    super.key,
    required this.valor,
    required this.onNumero,
    required this.onAcao,
    required this.onLimpar,
    required this.onCalcular,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, limits) {
          final double larguraLivre = limits.maxWidth - 32;
          final double alturaLivre = limits.maxHeight - 32;
          final double larguraCard = larguraLivre.clamp(300.0, 430.0);
          final double alturaCard = (larguraCard * 0.96).clamp(
            360.0,
            alturaLivre,
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
                      Tela(valor: valor),
                      const SizedBox(height: 6),
                      Teclado(
                        onNumero: onNumero,
                        onAcao: onAcao,
                        onLimpar: onLimpar,
                        onCalcular: onCalcular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
