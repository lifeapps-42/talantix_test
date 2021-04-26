import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/currency.dart';
import '../../providers/currencies_provider.dart';

class ButtonsListItem extends StatelessWidget {
  final Currency currency;

  const ButtonsListItem({Key? key, required this.currency}) : super(key: key);

  void _toggleCurrency(BuildContext context) {
    if (currency.lastPrice == null) {
      context.read(currsProvider).getLastPrice(currency);
    } else {
      context.read(currsProvider).resetCurrency(currency);
    }
  }

  Widget _buildButtonChild() {
    if (currency.lastPrice == null) {
      return Text(
        'Press Me',
        maxLines: 1,
      );
    } else {
      return Text(
        '${currency.lastPrice}',
        maxLines: 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () => _toggleCurrency(context),
        child: _buildButtonChild(),
        // ),
      ),
    );
  }
}
