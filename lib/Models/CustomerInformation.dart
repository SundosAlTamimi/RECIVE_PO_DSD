import 'package:flutter/material.dart';
class CustomerInformation
{
String _customerName;
String _phoneNo;
String _email;
double _point;
String _birthday;

CustomerInformation(this._customerName, this._phoneNo, this._email, this._point,
    this._birthday);

String get birthday => _birthday;

set birthday(String value) {
  _birthday = value;
}

double get point => _point;

set point(double value) {
  _point = value;
}

String get email => _email;

set email(String value) {
  _email = value;
}

String get phoneNo => _phoneNo;

set phoneNo(String value) {
  _phoneNo = value;
}

String get customerName => _customerName;

set customerName(String value) {
  _customerName = value;
}


}