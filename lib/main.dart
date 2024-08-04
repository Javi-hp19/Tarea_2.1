import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Verificador de Palíndromos',
      home: PalindromeChecker(),
    );
  }
}

class PalindromeChecker extends StatefulWidget {
  const PalindromeChecker({super.key});

  @override
  _PalindromeCheckerState createState() => _PalindromeCheckerState();
}

class _PalindromeCheckerState extends State<PalindromeChecker> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  bool esPalindromo(String texto) {
    String textoLimpio = texto.toLowerCase().replaceAll(RegExp(r'[\W_]+'), '');
    String textoInverso = textoLimpio.split('').reversed.join('');
    return textoLimpio == textoInverso;
  }

  void _checkPalindrome() {
    String userInput = _controller.text;
    bool isPalindrome = esPalindromo(userInput);
    setState(() {
      _result = isPalindrome ? 'Es un palíndromo.' : 'No es un palíndromo.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificador de Palíndromos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Ingrese texto para verificar',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _checkPalindrome,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(_result, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
