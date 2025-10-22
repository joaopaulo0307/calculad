import 'package:flutter/material.dart';
import 'calculadora.dart';
import 'widgets/botao_calculadora.dart';

void main() => runApp(const CalculadoraApp());

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Flutter',
      theme: ThemeData.dark(),
      home: const CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final Calculadora calc = Calculadora();
  String resultado = '';
  String num1 = '';
  String num2 = '';
  String operacao = '';

  void adicionarNumero(String numero) {
    setState(() {
      if (operacao.isEmpty) {
        num1 += numero;
        resultado = num1;
      } else {
        num2 += numero;
        resultado = num2;
      }
    });
  }

  void selecionarOperacao(String op) {
    setState(() {
      operacao = op;
    });
  }

  void calcular() {
    setState(() {
      int a = int.tryParse(num1) ?? 0;
      int b = int.tryParse(num2) ?? 0;
      switch (operacao) {
        case '+':
          resultado = calc.somar(a, b).toString();
          break;
        case '-':
          resultado = calc.subtrair(a, b).toString();
          break;
        case '×':
          resultado = calc.multiplicar(a, b).toString();
          break;
        case '÷':
          try {
            resultado = calc.dividir(a, b).toString();
          } catch (e) {
            resultado = 'Erro';
          }
          break;
      }
      // Reinicia para próxima operação
      num1 = resultado;
      num2 = '';
      operacao = '';
    });
  }

  void limpar() {
    setState(() {
      num1 = '';
      num2 = '';
      operacao = '';
      resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                resultado,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                buildLinha(['7', '8', '9', '÷']),
                buildLinha(['4', '5', '6', '×']),
                buildLinha(['1', '2', '3', '-']),
                buildLinha(['0', 'C', '=', '+']),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLinha(List<String> botoes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: botoes.map((b) {
        Color cor = Colors.grey;
        VoidCallback func;

        if (b == 'C') {
          cor = Colors.red;
          func = limpar;
        } else if (b == '=') {
          cor = Colors.orange;
          func = calcular;
        } else if (['+', '-', '×', '÷'].contains(b)) {
          cor = Colors.blue;
          func = () => selecionarOperacao(b);
        } else {
          func = () => adicionarNumero(b);
        }

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: BotaoCalculadora(texto: b, onPressed: func, cor: cor),
          ),
        );
      }).toList(),
    );
  }
}
