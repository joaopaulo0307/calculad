import 'package:flutter_test/flutter_test.dart';
import 'package:calculad/calculadora.dart';

void main() {
  group('Testes da Calculadora', () {
    final calc = Calculadora();

    test('Deve somar dois números corretamente', () {
      expect(calc.somar(2, 3), 5);
      expect(calc.somar(-1, 4), 3);
    });

    test('Deve subtrair corretamente', () {
      expect(calc.subtrair(5, 3), 2);
      expect(calc.subtrair(0, 4), -4);
    });

    test('Deve multiplicar corretamente', () {
      expect(calc.multiplicar(2, 3), 6);
      expect(calc.multiplicar(-2, 3), -6);
    });

    test('Deve dividir corretamente', () {
      expect(calc.dividir(6, 3), 2);
      expect(calc.dividir(5, 2), 2.5);
    });

    test('Divisão por zero lança exceção', () {
      expect(() => calc.dividir(5, 0), throwsException);
    });
  });
}
