import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/network.dart';
import 'package:bitcoin_ticker/utilities/dropDownAndriodIos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// const apiKey = 'E0CB308A-B831-4785-BDC7-0637357FC5DE';

const apiKey = 'E9169672-BB95-4CBA-9D9A-11ACA1E033C5';
const bitcoinApi = 'https://rest.coinapi.io/v1/exchangerate';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currencySelected = "";
  String criptoName = "";
  String currencyName = "";
  int rateBTC = 0;
  int rateETH = 0;
  int rateLTC = 0;

  String selectedCurrency = "USD";

  DropDownforAndriodIos dropDownforAndriodIos = DropDownforAndriodIos();

  @override
  void initState() {
    callGetDataBTC();
    callGetDataETH();
    callGetDataLTC();
    super.initState();

  }

// For BTC
  void callGetDataBTC() async {
    Map<String, dynamic> currencyData = await getdataBTC();
    updateUiBTC(currencyData);
  }

  Future<Map<String, dynamic>> getdataBTC({selectedcurrency = "USD"}) async {
    NetworkHelper networkHelper =
        NetworkHelper(url: '$bitcoinApi/BTC/$selectedCurrency?apikey=$apiKey');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }

  void updateUiBTC(Map<String, dynamic> currencyData) {
    setState(() {
      criptoName = currencyData['asset_id_base'];
      currencyName = currencyData['asset_id_quote'];
      double dobrate = currencyData['rate'];
      rateBTC = dobrate.toInt();
    });
  }

  // for ETH

  void callGetDataETH() async {
    Map<String, dynamic> currencyData = await getdataETH();
    updateUiETH(currencyData);
  }

  Future<Map<String, dynamic>> getdataETH({selectedcurrency = "USD"}) async {
    NetworkHelper networkHelper =
    NetworkHelper(url: '$bitcoinApi/ETH/$selectedCurrency?apikey=$apiKey');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }

  void updateUiETH(Map<String, dynamic> currencyData) {
    setState(() {
      criptoName = currencyData['asset_id_base'];
      currencyName = currencyData['asset_id_quote'];
      double dobrate = currencyData['rate'];
      rateETH = dobrate.toInt();
    });
  }

 // for LTC

  void callGetDataLTC() async {
    Map<String, dynamic> currencyData = await getdataLTC();
    updateUiLTC(currencyData);
  }

  Future<Map<String, dynamic>> getdataLTC({selectedcurrency = "USD"}) async {
    NetworkHelper networkHelper =
    NetworkHelper(url: '$bitcoinApi/LTC/$selectedCurrency?apikey=$apiKey');
    var currencyData = await networkHelper.getData();
    return currencyData;
  }

  void updateUiLTC(Map<String, dynamic> currencyData) {
    setState(() {
      criptoName = currencyData['asset_id_base'];
      currencyName = currencyData['asset_id_quote'];
      double dobrate = currencyData['rate'];
      rateLTC = dobrate.toInt();
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
          Column(
            children: [

              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(

                      '1 ${cryptoList[0]}  = $rateBTC $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[1]} = $rateETH $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                          '1 ${cryptoList[2]} = $rateLTC $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),





              //For Andriod
            ],
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
                var currencData = await getdataBTC(selectedcurrency: selectedCurrency);
                updateUiBTC(currencData);
                var eth =  await getdataETH(selectedcurrency: selectedCurrency);
                updateUiETH(eth);
                var ltc = await getdataLTC(selectedcurrency: selectedCurrency);
                updateUiLTC(ltc);
                setState(
                  () {},
                );
              },
            ),
          ),

          // for Iphone

          // Container(
          //   height: 150.0,
          //   alignment: Alignment.center,
          //   padding: EdgeInsets.only(bottom: 30.0),
          //   color: Colors.lightBlue,
          //   child: dropDownforAndriodIos.getIosDropDown(onSelectedItemChanged: (selectedIndex) async {
          //    int  selectedCurrencyIndex = selectedIndex;
          //      String selectedcurrency = currenciesList[selectedCurrencyIndex];
          //      currencySelected = selectedcurrency;
          //      var currencyData = await getdata(selectedcurrency: selectedcurrency);
          //      updateUi(currencyData);
          //      setState(() {
          //
          //      });
          //   },),
          // ),
        ],
      ),
    );

  }
}
