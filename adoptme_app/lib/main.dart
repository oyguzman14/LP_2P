import 'package:flutter/material.dart';
import 'package:adoptme_app/paginas/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Adopt Me',
    theme: ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: LoginPage.id,
    routes: {
      LoginPage.id : (context) => LoginPage(),
    },
  ));
}