import 'package:flutter/material.dart';

import './buttons_list.dart';

class ButtonsScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonsList(),
      ),
    );
  }
}
