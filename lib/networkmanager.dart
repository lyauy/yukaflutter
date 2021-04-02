import 'package:yuka/product.dart';

class NetworkManager {
  static final NetworkManager _NetworkManager = NetworkManager._internal();

  factory NetworkManager() {
    return _NetworkManager;
  }

  NetworkManager._internal();

  Product getProduct(String barcode) {
    return Product(barcode: barcode);
  }
}