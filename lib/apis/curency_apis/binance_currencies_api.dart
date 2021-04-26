import 'package:http/http.dart' as http;

import './currency_api_interface.dart';

class BinanceCurrencyApi implements ICurrencyApi {
  const BinanceCurrencyApi();
  @override
  Future<String> getCurrencies() async {
    http.Response _response =
        await http.get(Uri.parse('https://api.binance.com/api/v3/ticker/24hr'));
    if (_response.statusCode == 200) {
      print(_response.body);
      return _response.body;
    } else {
      throw 'Binance exeption ${_response.statusCode} ${_response.reasonPhrase}';
    }
  }
}
