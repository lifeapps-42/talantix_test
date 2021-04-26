import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../apis/curency_apis/binance_currencies_api.dart';
import '../models/currency.dart';

ChangeNotifierProvider<CurrenciesProvider> currsProvider =
    ChangeNotifierProvider((ref) => CurrenciesProvider());

class CurrenciesProvider with ChangeNotifier {
  List<Currency>? _currsList;
  List<Currency> get currs {
    if (_currsList == null) {
      _currsList = List.generate(500, (i) => Currency());
    }

    return [..._currsList!];
  }

  void getLastPrice(Currency currency) async {
    BinanceCurrencyApi _ref = BinanceCurrencyApi();
    String _responseJson = await _ref.getCurrencies();
    _applyCurrency(currency, _responseJson);
  }

  void _applyCurrency(Currency currency, String currencyJson) {
    currency.setLastPriceFromJson(jsonDecode(currencyJson), 'BTCUSDT');
    notifyListeners();
  }

  void resetCurrency(Currency currency) {
    currency.reset();
    notifyListeners();
  }
}
