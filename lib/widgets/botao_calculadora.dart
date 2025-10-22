import 'package:flutter/material.dart';

class BotaoCalculadora extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color cor;

  const BotaoCalculadora({
    required this.texto,
    required this.onPressed,
    this.cor = Colors.grey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: cor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
