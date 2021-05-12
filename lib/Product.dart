class Product{
  String _Product_Name;
  int _id;
  String _price;
  String _imageUrl;
  bool _off;
  String _description;

  Product(this._Product_Name, this._id, this._price, this._imageUrl, this._off,
      this._description);

  String get description => _description;

  bool get off => _off;

  String get imageUrl => _imageUrl;

  String get price => _price;

  int get id => _id;

  String get Product_Name => _Product_Name;
}