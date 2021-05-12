import 'package:flutter/material.dart';
import 'package:people/MyConfig.dart';
import 'package:people/Product.dart';

typedef OnRemovePressed (int index);
class ShoppingBasketItem extends StatefulWidget {
  Product _product;
  int _count = 1;
  int _index;
  num _maxcount = 5;
  OnRemovePressed _onRemovePressed;

  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
  ShoppingBasketItem(this._product, this._onRemovePressed, this._index);
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
                      onTap: (){Add_or_Dec(1);},),
                      SizedBox(width: 5),
                      Text(widget._count.toString(),),
                      SizedBox(width: 5),
                      GestureDetector(
                        child: GestureDetector(child: Icon(Icons.chevron_left, size:35), onTap: (){Navigator.pop(context);},),
                        onTap: (){Add_or_Dec(-1);},),

                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top:15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: Icon(Icons.delete, size:35),
                          onTap: (){widget._onRemovePressed(widget._index);},
                        ),
                        Text(widget._product.price),
                      ],
                    ),
                  ),

                ))

          ],
        ),
      ),
    );
  }
  void Add_or_Dec(int count){
    if((widget._count == 0) && (count<0))
      return;
    else
    if((widget._count >= widget._maxcount) && (count>0))
      return;
    else
      {
       setState(() {
         widget._count+=count;
         print(widget._count);
       });
      }

  }
}
 