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
  String selectedCurrency = "PKR";


  DropDownforAndriodIos dropDownforAndriodIos =DropDownforAndriodIos();

  @override
  void initState(){
  print(getdata());

  super.initState();
  }


  Future<dynamic> getdata() async {
    NetworkHelper networkHelper =
    NetworkHelper(url: '$bitcoinApi/BTC/USD?apikey=$apiKey');
    var currencyData = await networkHelper.getData();
    return currencyData;
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
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            child: Text("Click Me"),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: dropDownforAndriodIos.getIosDropDown()
              ),


        ],
      ),
    );
  }
}
