import 'package:flutter/material.dart';

class BtNumerico extends StatelessWidget {
  final String texto;
  final Function(String) onClick;

  const BtNumerico({super.key, required this.texto, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(1),
        child: SizedBox.expand(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
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
