import 'avaliador.dart';

// guarda o estado
class Controller {
  String valor = '0';
  String conta = '';
  bool temResultado = false;

  // adiciona um numero na conta atual
  void addNumero(String numero) {
    if (temResultado) {
      conta = '';
      temResultado = false;
    }

    final List<String> partes = Avaliador.separar(conta);
    if (partes.isNotEmpty && !Avaliador.ehAcao(partes.last)) {
      partes[partes.length - 1] = '${partes.last}$numero';
    } else {
      partes.add(numero);
    }

    conta = partes.join(' ');
    _mostrarConta();
  }

  // limpa a conta e o visor
  void limpar() {
    conta = '';
    temResultado = false;
    _mostrarConta();
  }

  // adiciona ou troca a acao atual
  void addAcao(String acao) {
    if (conta.isEmpty) {
      return;
    }

    final List<String> partes = Avaliador.separar(conta);
    if (partes.isEmpty) {
      return;
    }

    if (Avaliador.ehAcao(partes.last)) {
      partes[partes.length - 1] = acao;
    } else {
      partes.add(acao);
    }

    conta = partes.join(' ');
    temResultado = false;
    _mostrarConta();
  }

  // fecha a conta e mostra o resultado
  void calcular() {
    if (conta.isEmpty) {
      return;
    }

    final List<String> partes = Avaliador.separar(conta);
    if (partes.isEmpty || Avaliador.ehAcao(partes.last)) {
      return;
    }

    try {
      final double total = Avaliador.calcular(partes);
      valor = Avaliador.formatar(total);
      conta = valor;
      temResultado = true;
    } catch (_) {
      valor = 'erro';
      conta = '';
      temResultado = true;
    }
  }

  // atualiza o visor com a conta atual
  void _mostrarConta() {
    valor = conta.isEmpty ? '0' : conta;
  }
}
