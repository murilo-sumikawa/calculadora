import 'package:flutter/material.dart';

// botao usado para as acoes
class BotaoAcao extends StatelessWidget {
  final String texto;
  final ValueChanged<String> onClick;

  const BotaoAcao({super.key, required this.texto, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(1),
        child: SizedBox.expand(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            onPressed: () => onClick(texto),
            child: Text(texto, style: const TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
