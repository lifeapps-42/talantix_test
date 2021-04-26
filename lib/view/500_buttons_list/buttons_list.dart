import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './list_item.dart';
import '../../models/currency.dart';
import '../../providers/currencies_provider.dart';

class ButtonsList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    CurrenciesProvider _provider = watch(currsProvider);
    List<Currency> _currsList = _provider.currs;
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey,
      child: Container(
        height: 200,
        width: 100,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: _currsList.length,
            itemBuilder: (context, i) => ButtonsListItem(
              currency: _currsList[i],
              key: Key(i.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
