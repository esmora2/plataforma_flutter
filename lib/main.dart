import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plataforma Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlatformSpecificHome(),
    );
  }
}

class PlatformSpecificHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return AndroidView();
    } else if (Platform.isIOS) {
      return IOSView();
    } else {
      return Scaffold(
        appBar: AppBar(title: Text("Desconocido")),
        body: Center(child: Text("Plataforma no compatible")),
      );
    }
  }
}

class AndroidView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Android")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.android, size: 100),
            SizedBox(height: 20),
            Text("Esta es la interfaz para Android",
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class IOSView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("iOS")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_iphone, size: 100),
            SizedBox(height: 20),
            Text("Esta es la interfaz para iOS",
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
