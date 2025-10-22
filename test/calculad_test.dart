import 'package:flutter_test/flutter_test.dart';
import 'package:calculad/calculadora.dart';

void main() {
  group('Testes Calculadora', () {
    final calc = Calculadora();

    test('Soma correta', () {
      expect(calc.somar(2, 3), 5);
      expect(calc.somar(-1, 1), 0);
    });

    test('Subtração correta', () {
      expect(calc.subtrair(5, 3), 2);
    });

    test('Multiplicação correta', () {
      expect(calc.multiplicar(2, 4), 8);
    });

    test('Divisão correta', () {
      expect(calc.dividir(6, 2), 3);
    });

    test('Divisão por zero lança exceção', () {
      expect(() => calc.dividir(5, 0), throwsException);
    });
  });
}
