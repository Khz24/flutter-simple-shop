import 'package:people/Product.dart';

class ShoppingBasketData {
  static ShoppingBasketData _instance;

  List<Product> _basketItems;
  ShoppingBasketData(){
    // ignore: deprecated_member_use
    _basketItems = List<Product>();
  }

  static ShoppingBasketData getInstance(){
    if(_instance ==  null){
      _instance = ShoppingBasketData();
    }
    return _instance;
  }

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }
}