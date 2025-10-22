import 'package:flutter/material.dart';
import 'calculadora.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  final Calculadora calc = Calculadora();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora Simples'),
        ),
        body: CalculadoraScreen(calc: calc),
      ),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  final Calculadora calc;
  CalculadoraScreen({required this.calc});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String resultado = '';

  void somar() {
    int a = int.tryParse(num1Controller.text) ?? 0;
    int b = int.tryParse(num2Controller.text) ?? 0;
    setState(() {
      resultado = widget.calc.somar(a, b).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: num1Controller,
            decoration: InputDecoration(labelText: 'Número 1'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: num2Controller,
            decoration: InputDecoration(labelText: 'Número 2'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: somar,
            child: Text('Somar'),
          ),
          SizedBox(height: 20),
          Text('Resultado: $resultado', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
