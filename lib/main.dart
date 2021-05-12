import 'package:flutter/material.dart';
import 'package:people/Product.dart';
import 'package:people/ShoppingBasket.dart';
import 'BottomNavigate.dart';
import 'MyConfig.dart';
import 'package:http/http.dart' as http;
import 'package:people/DescriptionPage.dart';
import 'dart:convert';
import 'ShoppingBasketData.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Store(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<Product> _Items = [];
  @override
  void initState() {
    super.initState();
    fetchItems();
  }
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
          actions: [
            IconButton(icon: Icon(Icons.shopping_basket, color: Colors.green,),
                onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>ShoppingBasket())
                    );

                })
          ],
          leading: Icon(Icons.arrow_back_ios),
          // actions: <Widget>[ IconButton(icon: Icons.map, color: Colors.black38,)],
        ),
        body:
        Padding(
          padding: EdgeInsets.all(15),
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              children: List.generate(_Items.length, (int position) {
                return generateItem(_Items[position], context);
              })

          ),
        ),

        bottomNavigationBar: BottomNavigate(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.lightBlue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Card generateItem(Product product, mycontext)
  {
    String imgURL = product.imageUrl;
    if(imgURL == null) imgURL = "http://www.futuremusic-es.com/wp-content/uploads/2008/10/nopic.jpg";
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 5,
      child: InkWell(
        onTap: (){
          Navigator.of(mycontext).push(MaterialPageRoute(
              builder: (mycontext)=>DescriptionPage(product)
          ));
        },
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: (MediaQuery.of(context).size.width)*2/9,
                  width: (MediaQuery.of(context).size.width)*2/9,
                  child: Image.network(imgURL)
                // child: Image.network(imgURL,fit: BoxFit.fill,
                //   loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                //     if (loadingProgress == null) return child;
                //     return Center(
                //       child: CircularProgressIndicator(
                //         value: loadingProgress.expectedTotalBytes != null ?
                //         loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                //             : null,
                //       ),
                //     );
                //   },
                // ),
              ),
              Text(product.Product_Name,
                style:TextStyle(
                  color: my_txt1_color,
                  fontFamily: my_txt_font,
                  fontSize: 14.0,
                ),
              ),
              Text(product.price,
                style:TextStyle(
                  color: my_txt2_color,
                  fontFamily: my_txt_font,
                  fontSize: 14.0,
                ),
              )

            ],
          ),
        ),
      ),

    );
  }

  Future<void> fetchItems() async {
    // final url = 'https://jsonplaceholder.typicode.com/todos';
    //final url = 'http://aliprog.ir/flutter/json/todo.json';

    final url = 'http://welearnacademy.ir/flutter/products_list.json';
    try {
      // http.head(url);
      final http.Response response = await http.get(Uri.parse(url));
      print(url);
      //print(utf8.decode( response.bodyBytes));
      setState(() {
        var productjson = json.decode(utf8.decode( response.bodyBytes));
        for(var id in productjson){
          var productItem = Product(
              id['product_name'],
              id['id'],
              id['price'],
              id['image_url'],
              id['off'],
              id['description']
          );
          _Items.add(productItem);
        }
      });

      // final _loadedTodos = json.decode(response.body);
      // setState(() {
      //   _todos = _loadedTodos;
      // });
    } catch (err) {
      throw err;
    }
  }
}

