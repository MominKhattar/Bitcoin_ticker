import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../coin_data.dart';

class DropDownforAndriodIos{
  String selectedCurrency = "PKR";

  DropdownButton<String>? getAndriodDropDownButton( {onChanged}) {
  List<DropdownMenuItem<String>> dropDownItems = [];
  for (String currency in currenciesList) {
    var newItems = DropdownMenuItem(
      child: Text(currency),
      value: currency,
    );
    dropDownItems.add(newItems);
  }
  return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: onChanged);
}

 getIosDropDown() {
  List<Widget> dropDownItems = [];
  for (var currency in currenciesList) {
    var newItems = Text(currency);
    dropDownItems.add(newItems);
  }
  return CupertinoPicker(
    itemExtent: 32,
    backgroundColor: Colors.lightBlue,
    onSelectedItemChanged: (selectedIndex) {
      print(selectedIndex);
    },
    children: dropDownItems,
  );
}

}