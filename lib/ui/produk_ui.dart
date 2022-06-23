import 'package:toko_dummy/model/produk.dart';
import 'package:toko_dummy/helper/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdukUi extends ChangeNotifier {
  List<Product> product = [];
  bool isLoading = true;

  ProdukUi() {
    getData();
  }

  void getData() {
    isLoading = true;
    notifyListeners();
    api.getProduk().then((value) {
      isLoading = false;
      if (value != null) {
        product = value;
      }
      notifyListeners();
    });
  }
}
