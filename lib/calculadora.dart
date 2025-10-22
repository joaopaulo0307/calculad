class Calculadora {
  int somar(int a, int b) => a + b;
  int subtrair(int a, int b) => a - b;
  int multiplicar(int a, int b) => a * b;
  double dividir(int a, int b) {
    if (b == 0) throw Exception('Divisão por zero não é permitida');
    return a / b;
  }
}
