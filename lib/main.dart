import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Flutter',
      debugShowCheckedModeBanner: false,
      home: Platform.isIOS ? IOSConverter() : AndroidConverter(),
    );
  }
}

// -------------------- ANDROID --------------------
class AndroidConverter extends StatefulWidget {
  @override
  _AndroidConverterState createState() => _AndroidConverterState();
}

class _AndroidConverterState extends State<AndroidConverter> {
  double celsius = 0.0;
  String result = "";

  void convert() {
    double fahrenheit = (celsius * 9 / 5) + 32;
    setState(() {
      result = "$celsius °C = ${fahrenheit.toStringAsFixed(2)} °F";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conversor Android")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType:
              TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Grados Celsius",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                celsius = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convert,
              child: Text("Convertir a Fahrenheit"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 40),
            Icon(Icons.android, size: 100, color: Colors.green),
          ],
        ),
      ),
    );
  }
}

// -------------------- IOS --------------------
class IOSConverter extends StatefulWidget {
  @override
  _IOSConverterState createState() => _IOSConverterState();
}

class _IOSConverterState extends State<IOSConverter> {
  double celsius = 0.0;
  String result = "";

  void convert() {
    double fahrenheit = (celsius * 9 / 5) + 32;
    setState(() {
      result = "$celsius °C = ${fahrenheit.toStringAsFixed(2)} °F";
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Conversor iOS"),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CupertinoTextField(
                keyboardType:
                TextInputType.numberWithOptions(decimal: true),
                placeholder: "Grados Celsius",
                onChanged: (value) {
                  celsius = double.tryParse(value) ?? 0.0;
                },
              ),
              SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: convert,
                child: Text("Convertir a Fahrenheit"),
              ),
              SizedBox(height: 20),
              Text(
                result,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 40),
              Icon(CupertinoIcons.device_phone_portrait,
                  size: 100, color: CupertinoColors.activeBlue),
            ],
          ),
        ),
      ),
    );
  }
}
