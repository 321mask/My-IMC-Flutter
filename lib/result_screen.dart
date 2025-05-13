import 'package:flutter/material.dart';
import 'services/imc_storage.dart';

class ResultScreen extends StatelessWidget {
  final double imc;

  ResultScreen({required this.imc});

  String getIMCText(double imc) {
    if (imc < 18.5) return 'Underweight';
    if (imc < 25) return 'Normal';
    if (imc < 30) return 'Overweight';
    return 'Obese';
  }

  @override
  Widget build(BuildContext context) {
    IMCStorage.saveIMC(imc);
    final status = getIMCText(imc);

    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1669322893266-d6ed955021fd?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your IMC is:', style: TextStyle(fontSize: 20, color: Colors.white)),
            Text(imc.toStringAsFixed(2), style: TextStyle(fontSize: 32, color: Colors.white)),
            SizedBox(height: 20),
            Text(status, style: TextStyle(fontSize: 24, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
