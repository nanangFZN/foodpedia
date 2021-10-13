import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SpalashPage extends StatefulWidget {
  SpalashPage({Key key}) : super(key: key);

  @override
  _SpalashPageState createState() => _SpalashPageState();
}

class _SpalashPageState extends State<SpalashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds:3),(){
        Navigator.pushNamed(context, '/started');
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(

      decoration: BoxDecoration(
        gradient:LinearGradient(
          begin:Alignment.topRight,
          end:Alignment.bottomLeft,
          colors:[Color(0xFF243748),Color(0xFF4b749f)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
         body:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center(
               child: Container(
                 width: width*0.75,
                 height: height*0.4,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   image: DecorationImage(image: AssetImage('assets/splash.jpg'),fit: BoxFit.fill)
                 ),
                ),
             ),
             Text('FoodPedia',style: GoogleFonts.poppins(
               fontSize:24,
               fontWeight: FontWeight.bold,
               color: Colors.white
             ),)
           ],)
      ),
    );
  }
}