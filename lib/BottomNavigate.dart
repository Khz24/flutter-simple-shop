import 'package:flutter/material.dart';
import 'MyConfig.dart';

class BottomNavigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: my_color_bottom_nav,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/2-20,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, color:my_icon_color_nav ),
                  Icon(Icons.people, color:my_icon_color_nav ),
                ],
              )
            ),
            Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.clear, color:my_icon_color_nav ,),
                    Icon(Icons.build, color:my_icon_color_nav ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
