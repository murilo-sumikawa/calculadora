import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String valor;

  const Display({super.key, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(valor, style: const TextStyle(fontSize: 40)),
    );
  }
}
