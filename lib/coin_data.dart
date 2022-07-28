// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  final selectedValue;
  final apiKey;
  CoinData({this.selectedValue, this.apiKey});

  Future getData() async {
    final url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedValue?apikey=$apiKey');
    var response = await http.get(url);
    var parsedData = jsonDecode(response.body);
    print(parsedData['time']);
    return parsedData;
  }
}
