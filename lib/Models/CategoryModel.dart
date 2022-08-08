import 'package:flutter/material.dart';
class CategoryModel {
  String _categoryName;
  String _categoryPic;

  CategoryModel(this._categoryName, this._categoryPic);

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  String get categoryPic => _categoryPic;

  set categoryPic(String value) {
    _categoryPic = value;
  }


}