import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Started extends StatefulWidget {
  Started({Key key}) : super(key: key);

  @override
  _StartedState createState() => _StartedState();
}

class _StartedState extends State<Started> {
 
  @override
  Widget build(BuildContext context) {
     final width=MediaQuery.of(context).size.width;
     final height=MediaQuery.of(context).size.height;
    return Scaffold(
       body: Column(
         children: [
           Container(
             width:width,
             height:height,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/started.jpg'),fit: BoxFit.cover),
             ),
             
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height:height*0.15),
                       Text('Now , Ordering \n Food is Easily ',
                       textAlign:TextAlign.left,
                       style: GoogleFonts.poppins(
                         fontSize:34,
                         fontWeight: FontWeight.bold,
                         color:Colors.white
                       ),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(left:width*0.05),
                         child: Container(
                           width: width*0.5,
                           height: height*0.075,
                           child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary:Colors.amber
                             ),
                             onPressed: (){
                               Navigator.pushNamed(context, '/login');
                             },
                              child: Text('Get Started',style:GoogleFonts.poppins(
                                fontSize:24,
                                fontWeight: FontWeight.bold,
                              ))),
                         ),
                       )
                     ],
                   ),
                 ),
              
           
         ],),
    );
  }
}