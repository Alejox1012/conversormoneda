import 'package:flutter/material.dart';
/* Proyecto Práctico Parte 2. Ejercisio 2 Conversor de monedas
  Desarrollo de aplicaciones Híbridas
   hecho por:
    -  Didian alejandro valencia ruiz
    -  Harold Rafael Martinez Martinez  */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Conversor de Monedas'),
        ),
        body: CurrencyConverter(),
      ),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double amount = 1.0;
  String baseCurrency = 'COP';
  String targetCurrency = 'USD';

  final Map<String, double> exchangeRates = {
    'COP': 4368.40,
    'USD': 1.06,
    'EUR': 1.0,
  };

  double convertCurrency() {
    final rate = exchangeRates[targetCurrency]! / exchangeRates[baseCurrency]!;
    return amount * rate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Conversor de Monedas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Cantidad en $baseCurrency'),
            onChanged: (value) {
              setState(() {
                amount = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          SizedBox(height: 16.0),
          DropdownButton<String>(
            value: baseCurrency,
            items: <String>['COP', 'USD', 'EUR'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                baseCurrency = value!;
              });
            },
          ),
          SizedBox(height: 16.0),
          Text(
            'Convertir a:',
            style: TextStyle(fontSize: 18),
          ),
          DropdownButton<String>(
            value: targetCurrency,
            items: <String>['COP', 'USD', 'EUR'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                targetCurrency = value!;
              });
            },
          ),
          SizedBox(height: 16.0),
          Text(
            'Resultado: ${convertCurrency().toStringAsFixed(2)} $targetCurrency',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue, // Color azul
            ),
          ),
        ],
      ),
    );
  }
}

