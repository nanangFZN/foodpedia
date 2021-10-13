import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopMenu extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  TopMenu({this.image,this.title,this.price});
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
                          children: [
                            Container(
                              width:width*0.4,
                              height:height*0.25,
                              decoration: BoxDecoration(
                                color:Colors.yellow,
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(image:AssetImage(image))
                              ),
                            ),
                          Padding(
                            padding:  EdgeInsets.only(left:width*0.015,right:width*0.015),
                            child: Container(
                              width:width*0.4,
                              child: Text(title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style:GoogleFonts.roboto(
                                fontSize:16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ) ,),
                            ),
                          ),
                           Padding(
                            padding:  EdgeInsets.only(left:width*0.015,right:width*0.015 ,bottom:height*0.015),
                            child: Text(price,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                  style:GoogleFonts.roboto(
                    fontSize:14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ) ,),
                          ),
                          ],
                        );
    
                                            
  }
}