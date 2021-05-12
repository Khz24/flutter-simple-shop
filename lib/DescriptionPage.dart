import 'package:flutter/material.dart';
import 'package:people/Product.dart';
import 'package:people/ShoppingBasketData.dart';
import 'MyConfig.dart';
class DescriptionPage extends StatelessWidget {
  Product _product;
  DescriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(
          App_Cap,
          style: TextStyle(fontFamily: my_txt_font, color: my_txtTitle_color),
        ),
        backgroundColor: Colors.black12,
        elevation: 1,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        // actions: <Widget>[ IconButton(icon: Icons.map, color: Colors.black38,)],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Align(
            child: Text(
              _product.Product_Name,
              style: TextStyle(
                fontFamily: my_txt_font,
                color: Colors.grey[700],
                fontSize: 35,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          SizedBox(height: 10,),
          Center(
            child: Image.network(_product.imageUrl,

              height: (MediaQuery.of(context).size.width)*1/4,
              width: (MediaQuery.of(context).size.width)*1/4,
              fit: BoxFit.contain,),
          ),
          Text(_product.price,
            style: TextStyle(
            fontFamily: my_txt_font,
            color: Colors.red,
            fontSize: 35,
          ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text(_product.description,
              style: TextStyle(
                fontFamily: my_txt_font,
                color: Colors.grey[700],
                fontSize: 16,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          Expanded(
            child: Align(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    print('Add to basket');
                    ShoppingBasketData.getInstance().basketItems.add(_product);
                    print(_product.Product_Name);
                    int x = ShoppingBasketData.getInstance().basketItems.length;
                    print(x);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[600],
                        borderRadius: BorderRadius.all(Radius.circular(5)),

                    ),
                    child: Center(
                      child: Text("افزودن به سبد خرید",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: my_txt_font
                        ),
                      ),
                    ),

                    width: MediaQuery.of(context).size.width - 50,
                    height: 70,
                  ),
                ),

              ),
              alignment: Alignment.bottomCenter,
            ),
          ),

        ],
      ),

    );
  }
}
