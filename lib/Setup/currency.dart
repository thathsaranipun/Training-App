import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final fromTextController = TextEditingController();
  late List<String> currencies = [];
  String fromCurrency = "USD";
  String toCurrency = "LKR";
  late String result="";

  @override
  void initState() {
    super.initState();
    _loadCurrencies();
  }

  Future<String> _loadCurrencies() async {
    String uri = "https://api.apilayer.com/exchangerates_data/latest";
    var response = await http.get(Uri.parse(uri), headers: {"Accept": "application/json","apikey": "a8aqYVeT8EXN0QkrGXvnm704kUUSBeaw"});
    var responseBody = json.decode(response.body);
    Map<String, dynamic> curMap = responseBody['rates'];
    currencies = curMap.keys.toList();
    setState(() {});
    print(currencies);
    return "Success";
  }

  Future<String> _doConversion() async {
    String uri = "https://api.apilayer.com/exchangerates_data/latest?symbols=$toCurrency&base=$fromCurrency";
    var response = await http.get(Uri.parse(uri), headers: {"Accept": "application/json","apikey": "a8aqYVeT8EXN0QkrGXvnm704kUUSBeaw"});
    var responseBody = json.decode(response.body);
    setState(() {
      result = (double.parse(fromTextController.text) * (responseBody["rates"][toCurrency])).toString();
    });
    print(result);
    return "Success";
  }

  _onFromChanged(String value) {
    setState(() {
      fromCurrency = value;
    });
  }

  _onToChanged(String value) {
    setState(() {
      toCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
      ),
      body: currencies == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3.0,
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ListTile(
                        title: TextField(
                          controller: fromTextController,
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                        ),
                        trailing: _buildDropDownButton(fromCurrency),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                        child: ElevatedButton(
                          onPressed: _doConversion,
                          child: Text('Click to Convert'), 
                        ),
                      ),
                      ListTile(
                        title: Chip(
                          label: result != null ?
                          Text(
                            result,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ) : Text(""),
                        ),
                        trailing: _buildDropDownButton(toCurrency),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildDropDownButton(String currencyCategory) {
    return DropdownButton(
      value: currencyCategory,
      items: currencies
          .map((String value) => DropdownMenuItem(
                value: value,
                child: Row(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ))
          .toList(),
      onChanged: (value) {
        if(currencyCategory == fromCurrency){
          _onFromChanged(value as String);
        }else {
          _onToChanged(value as String);
        }
      },
    );
  }
}