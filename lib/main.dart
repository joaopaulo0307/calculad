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
      theme: ThemeData(primarySwatch: Colors.blue),
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
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String resultado = '';

  void somar() {
    int a = int.tryParse(num1Controller.text) ?? 0;
    int b = int.tryParse(num2Controller.text) ?? 0;
    setState(() => resultado = calc.somar(a, b).toString());
  }

  void subtrair() {
    int a = int.tryParse(num1Controller.text) ?? 0;
    int b = int.tryParse(num2Controller.text) ?? 0;
    setState(() => resultado = calc.subtrair(a, b).toString());
  }

  void multiplicar() {
    int a = int.tryParse(num1Controller.text) ?? 0;
    int b = int.tryParse(num2Controller.text) ?? 0;
    setState(() => resultado = calc.multiplicar(a, b).toString());
  }

  void dividir() {
    int a = int.tryParse(num1Controller.text) ?? 0;
    int b = int.tryParse(num2Controller.text) ?? 1;
    try {
      setState(() => resultado = calc.dividir(a, b).toString());
    } catch (e) {
      setState(() => resultado = e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora Estilizada')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                BotaoCalculadora(texto: '+', onPressed: somar),
                BotaoCalculadora(texto: '-', onPressed: subtrair),
                BotaoCalculadora(texto: '×', onPressed: multiplicar),
                BotaoCalculadora(texto: '÷', onPressed: dividir),
              ],
            ),
            const SizedBox(height: 30),
            Text('Resultado: $resultado', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
