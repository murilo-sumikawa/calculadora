// faz as contas com os tokens da expressao
class Avaliador {
  static String formatar(double numero) {
    if (numero % 1 == 0) {
      return numero.toInt().toString();
    }

    return numero.toString();
  }

  // diz se o texto é uma operacao
  static bool ehAcao(String texto) {
    return texto == '+' || texto == '-' || texto == '*' || texto == '/';
  }

  // separa a conta em partes
  static List<String> separar(String conta) {
    return conta.split(' ').where((parte) => parte.isNotEmpty).toList();
  }

  // resolve a conta de acordo com a prioridade
  static double calcular(List<String> partes) {
    final List<String> fila = [];
    int i = 0;

    while (i < partes.length) {
      final String item = partes[i];

      if (item == '*' || item == '/') {
        final double a = double.parse(fila.removeLast());
        final double b = double.parse(partes[i + 1]);

        if (item == '/' && b == 0) {
          throw Exception('divisão por zero');
        }

        final double parcial = item == '*' ? a * b : a / b;
        fila.add(parcial.toString());
        i += 2;
        continue;
      }

      fila.add(item);
      i++;
    }

    double total = double.parse(fila[0]);
    i = 1;

    while (i < fila.length) {
      final String acao = fila[i];
      final double numero = double.parse(fila[i + 1]);

      if (acao == '+') {
        total += numero;
      } else if (acao == '-') {
        total -= numero;
      }

      i += 2;
    }

    return total;
  }
}
