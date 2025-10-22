import 'package:flutter_test/flutter_test.dart';
import 'package:calculad/calculadora.dart';

void main() {
  group('Testes Calculadora', () {
    final calc = Calculadora();

    // -------------------
    // Testes de sucesso
    // -------------------
    test('Soma correta', () {
      expect(calc.somar(2, 3), 5);
      expect(calc.somar(-1, 1), 0);
      expect(calc.somar(0, 0), 0);
    });

    test('Subtração correta', () {
      expect(calc.subtrair(5, 3), 2);
      expect(calc.subtrair(3, 5), -2); // resultado negativo
    });

    test('Multiplicação correta', () {
      expect(calc.multiplicar(2, 4), 8);
      expect(calc.multiplicar(5, 0), 0); // multiplicar por zero
    });

    test('Divisão correta', () {
      expect(calc.dividir(6, 2), 3);
      expect(calc.dividir(5, 2), 2.5); // divisão com decimal
    });

    // -------------------
    // Testes de falha
    // -------------------
    test('Divisão por zero lança exceção', () {
      expect(() => calc.dividir(5, 0), throwsException);
    });

    test('Soma com números grandes', () {
      expect(calc.somar(1000000, 999999), 1999999); // testar overflow
    });

    test('Entradas inválidas simuladas (exemplo com string)', () {
      // Aqui só podemos simular caso a função trate entradas inválidas
      // Se a função aceitar apenas int, no Flutter/Dart geralmente se usa tryParse antes
      int? a = int.tryParse('abc');
      int? b = int.tryParse('123');
      expect(a, null);
      expect(b, 123);
    });
  });
}
