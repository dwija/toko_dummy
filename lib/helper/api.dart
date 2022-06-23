import 'package:toko_dummy/model/produk.dart';
import 'package:http/http.dart' as http;

class Api {
  final String baseUrl = 'https://dummyjson.com/products';

  Future getProduk() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (produkFromJson(response.body).limit == 30) {
        return produkFromJson(response.body).products;
      } else {
        return null;
      }
    } catch (e) {
      return e;
    }
  }
}

final api = Api();
