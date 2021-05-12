import 'package:flutter/material.dart';
import 'package:people/MyConfig.dart';
import 'package:people/Product.dart';
class ShoppingBasketItem extends StatefulWidget {
  Product _product;
  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();

  ShoppingBasketItem(this._product);
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 200,
        child: Row(
          // کشیدگی آیتم ها
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          // راست به چپ بودن
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 30, left: 20),
              child: Image.network(widget._product.imageUrl, width: 100, height: 100,),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top:30, right: 20),
                  child:
                    Text(widget._product.Product_Name,
                      style: TextStyle(fontFamily: my_txt_font, fontSize: 20),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:20),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.chevron_right, size:35),
                      ),
                      SizedBox(width: 5),
                      Text(widget._product.,),
                      SizedBox(width: 5),
                      GestureDetector(
                        child: Icon(Icons.chevron_left, size:35),
                      ),

                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
 