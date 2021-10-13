import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleBottomNavigation extends StatefulWidget {
  GoogleBottomNavigation({Key key}) : super(key: key);

  @override
  _GoogleBottomNavigationState createState() => _GoogleBottomNavigationState();
}

class _GoogleBottomNavigationState extends State<GoogleBottomNavigation> {
  int _index=0;
  List<Color>colors=[
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.green
  ];
  List<Text>title=[
    Text('Home'),
    Text('Cart'),
    Text('Status'),
    Text('Profile')
  ];
  PageController controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: PageView.builder(
        itemCount: 4,
        controller: controller,
        onPageChanged: (page){
          setState(() {
            _index=page;
          });
        },
          itemBuilder:(context,position){
            return Container(
              color:colors[position],
              child: title[position],
            );
          }
         
      ),
    );
  }
}