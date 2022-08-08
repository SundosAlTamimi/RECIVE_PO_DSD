import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
class Item {
  String _categoryName;
  String _itemName;
  int _itemBarcode;
  String _categoryPic;
  String _description;
  double _price;
  String _ItemPic;
  int _indexOfItem;
  int _indexOfCat;
  double _QTY;
  double _Total;
  int _point;
  double _tax;


  Item();




  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  String get itemName => _itemName;

  set itemName(String value) {
    _itemName = value;
  }

  int get itemBarcode => _itemBarcode;

  set itemBarcode(int value) {
    _itemBarcode = value;
  }

  double get tax => _tax;

  set tax(double value) {
    _tax = value;
  }

  int get point => _point;

  set point(int value) {
    _point = value;
  }

  double get Total => _Total;

  set Total(double value) {
    _Total = value;
  }

  double get QTY => _QTY;

  set QTY(double value) {
    _QTY = value;
  }

  int get indexOfCat => _indexOfCat;

  set indexOfCat(int value) {
    _indexOfCat = value;
  }

  int get indexOfItem => _indexOfItem;

  set indexOfItem(int value) {
    _indexOfItem = value;
  }

  String get ItemPic => _ItemPic;

  set ItemPic(String value) {
    _ItemPic = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get categoryPic => _categoryPic;

  set categoryPic(String value) {
    _categoryPic = value;
  }


}