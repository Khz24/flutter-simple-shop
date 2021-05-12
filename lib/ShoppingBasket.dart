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
          title: Text(
            "سبد خرید",
            style: TextStyle(fontFamily: my_txt_font, color: my_txtTitle_color),
          ),
          backgroundColor: Colors.black12,
          elevation: 1,
          centerTitle: true,

          leading: Icon(Icons.arrow_back_ios),
          // actions: <Widget>[ IconButton(icon: Icons.map, color: Colors.black38,)],
        ),
        body: BasketUI());
  }

  BasketUI() {
    return Stack(
      children: [
        ListView.builder(
            itemCount: ShoppingBasketData.getInstance().basketItems.length,
            itemBuilder: (context, position) {
              return GestureDetector(
                child: Padding(
                  child: ShoppingBasketItem(
                      ShoppingBasketData.getInstance().basketItems[position],
                      removeItem,
                      position),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                ),
              );
            }),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Center(
                          child: Text(
                            "پرداخت",
                            style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        )
      ],
    );
  }

  void removeItem(int index) {
    // if(onClicked) {
    setState(() {
      if (ShoppingBasketData.getInstance().basketItems.isNotEmpty) {
        ShoppingBasketData.getInstance().basketItems.removeAt(index);
        print('removeAt($index)');
      }
    });
    // }
  }
}
