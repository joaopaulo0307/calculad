class Calculadora {
  // Função de soma
  int somar(int a, int b) {
    return a + b;
  }

  // Função de subtração
  int subtrair(int a, int b) {
    return a - b;
  }

  // Função de multiplicação
  int multiplicar(int a, int b) {
    return a * b;
  }

  // Função de divisão
  double dividir(int a, int b) {
    if (b == 0) {
      throw Exception('Divisão por zero não é permitida');
    }
    return a / b;
  }
}
