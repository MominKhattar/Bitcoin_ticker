import 'package:bitcoin_ticker/services/network.dart';
import 'package:bitcoin_ticker/utilities/dropDownAndriodIos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const apiKey = 'E0CB308A-B831-4785-BDC7-0637357FC5DE';
const bitcoinApi = 'https://rest.coinapi.io/v1/exchangerate';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String criptoName = "";
  String currencyName = "";
  int rate = 0;

  String selectedCurrency = "USD";

  DropDownforAndriodIos dropDownforAndriodIos = DropDownforAndriodIos();

  @override
  void initState() {
    callGetData();
    super.initState();
  }

  void callGetData() async {
    Map<String, dynamic> currencyData = await getdata();
    updateUi(currencyData);
  }

  Future<Map<String, dynamic>> getdata({selectedcurrency = "USD"}) async {
    NetworkHelper networkHelper =
        NetworkHelper(url: '$bitcoinApi/BTC/$selectedCurrency?apikey=$apiKey');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }

  void updateUi(Map<String, dynamic> currencyData) {
    setState(() {
      criptoName = currencyData['asset_id_base'];
      currencyName = currencyData['asset_id_quote'];
      double dobrate = currencyData['rate'];
      rate = dobrate.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  '1 BTC = $rate $currencyName',
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
            child: dropDownforAndriodIos.getAndriodDropDownButton(
              selectedCurrency: selectedCurrency,
              onChanged: (value) async {
                selectedCurrency = value;
                var currencData =
                    await getdata(selectedcurrency: selectedCurrency);
                updateUi(currencData);
                setState(
                  () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
