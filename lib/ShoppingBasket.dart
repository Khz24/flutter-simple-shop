import 'package:flutter/material.dart';
import 'package:people/ShoppingBasketItem.dart';
import 'ShoppingBasketData.dart';
import 'MyConfig.dart';
class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
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
      body: BasketUI()

    );
  }

  BasketUI() {
    return ListView.builder(
      itemCount: ShoppingBasketData.getInstance().basketItems.length,
        itemBuilder: (context, position){
          return GestureDetector(
            child: Padding(
                child: ShoppingBasketItem(ShoppingBasketData.getInstance().basketItems[position]),
              padding: EdgeInsets.only(left:10, right: 10, top:10),
            ),
          );
        }
    );
  }
}
