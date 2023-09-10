import 'package:flutter/material.dart';

import '/provider/mails.dart';
import '/Screen/loginScreen.dart';
import '/Screen/homeScreen.dart';
import '/provider/mail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Mail> _availableMails = DUMMY_MAILS;
  List<Mail> _searchMails = DUMMY_MAILS;

  void _search(String text) {
    setState(() {
      _searchMails = _availableMails
          .where((element) =>
              element.sender.toUpperCase().contains(text) ||
              element.subject.toUpperCase().contains(text) ||
              element.sender.toLowerCase().contains(text) ||
              element.subject.toLowerCase().contains(text) ||
              element.sender.contains(text) ||
              element.subject.contains(text))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(_searchMails, _search),
      },
    );
  }
}
