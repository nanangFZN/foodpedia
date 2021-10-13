import 'package:absensi/pages/cart.dart';
import 'package:absensi/pages/home.dart';
import 'package:absensi/pages/profile.dart';
import 'package:absensi/pages/status.dart';
import 'package:absensi/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List pages=[
    HomePage(),
    Cart(),
    Profile(),

    
  ];
 
  PageController controller=PageController();
  int _index=0;
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
       body: PageView.builder(
         itemCount: 3,
         controller: controller,
         onPageChanged: (page){
           setState(() {
             _index=page;
           });
         },
         
         itemBuilder: (context,position){
           return Container(
            child:pages[position],
           );
         }),
        bottomNavigationBar: Container(
          height:height*0.075,
          child: GNav(
            rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 8,
              activeColor: Colors.purple,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100],
              color: Colors.pink,
  tabs: [
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.history,
      text: 'Cart',
    ),
   
    GButton(
      icon: Icons.person,
      text: 'Profile',
    )
  ],
  selectedIndex: _index,
  onTabChange: (index){
    setState(() {
      _index=index;
    });
    controller.jumpToPage(index);
  },
),
        ),
    );
  }
}