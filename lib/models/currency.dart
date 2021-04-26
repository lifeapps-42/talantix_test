

class Currency {
  double? lastPrice;

  Currency({this.lastPrice});

  void setLastPriceFromJson(List decodedJson, String symbol) {
    this.lastPrice = double.parse((decodedJson).singleWhere(
        (_currency) => _currency['symbol'] == symbol)['lastPrice']);
  }

  void reset() {
    this.lastPrice = null;
  }
}
