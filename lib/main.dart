import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/Screen/loginScreen.dart';
import 'Screen/homeScreen.dart';
import 'provider/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            title: 'Mail',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoginScreen(),
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
            },
          ),
        ));
  }
}
