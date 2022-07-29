// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, unused_local_variable, use_key_in_widget_constructors, library_private_types_in_public_api, must_call_super
import 'dart:convert';

import 'package:bitcoin/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apikey = '5B01AF21-2201-4865-8E91-E030A44280D5';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? parsedCoin;
  @override
  void initState() {
    final test = getData();

    print(test);
  }

  String selectedCurrency = 'USD';
  Future<Map> getData() async {
    final url = Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/INR?apikey=$apikey');
    var response = await http.get(url);
    var parsed = jsonDecode(response.body);
    // var test2 = parsed['time'];
    // print(parsed);
    return parsed;
  }

  @override
  Widget build(BuildContext context) {
    // print('$parsedCoin + asdfhlsdfj');
    // var data = CoinData(apiKey: apikey, selectedValue: selectedCurrency);
    // var currencyData = data.getData();
    // print('Hello');
    // print(currencyData);
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC =  $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: [
                // DropdownMenuItem(child: Text('BTC'), value: 'BTC'),
                // DropdownMenuItem(child: Text('ETH'), value: 'ETH'),
                // DropdownMenuItem(child: Text('LTC'), value: 'LTC'),

                // currenciesList.forEach((element) {
                //   return DropdownMenuItem(
                //     child: Text(element),
                //     value: element,
                //   );
                // }),

                for (String currency in currenciesList)
                  DropdownMenuItem(
                    child: Text(currency),
                    value: currency,
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value!;
                });
                print(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
