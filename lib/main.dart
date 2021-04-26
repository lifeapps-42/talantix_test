import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Talantix Test',
        initialRoute: ButtonsListRoute.route,
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  elevation: MaterialStateProperty.all(0),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            ),
            scaffoldBackgroundColor: Colors.black),
        routes: {
          ButtonsListRoute.route: (context) => ButtonsListRoute(),
        },
      ),
    );
  }
}
