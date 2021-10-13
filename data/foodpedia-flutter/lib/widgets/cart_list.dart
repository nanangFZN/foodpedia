import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartList extends StatelessWidget {
  final String title;
  final String price;
  final String quantity;
  final String status;
  CartList({this.title, this.price, this.quantity, this.status});
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(bottom:height*0.015),
      child: Center(
        child: Container(
                         width: width*0.95,
                            height: height*0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:BorderRadius.circular(25)
                            ),
                            child: Row(children: [
                              Padding(
                                padding:  EdgeInsets.only(left:width*0.015),
                                child: Container(
                                  width:width*0.3,
                                  height:height*0.15,
                                  decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(15),
                                    image: DecorationImage(image:AssetImage('assets/main.png'))
                                  )
                                  
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Text(title,
                                    style:GoogleFonts.roboto(
                                      fontSize:20,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  Text(price,
                                    style:GoogleFonts.roboto(
                                      fontSize:16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red
                                    )
                                  ),
                                  Text(quantity,
                                    style:GoogleFonts.roboto(
                                      fontSize:16,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                  SizedBox(height:height*0.025),
                                  Text(status,
                                    style:GoogleFonts.roboto(
                                      fontSize:16,
                                      fontWeight: FontWeight.bold,
                                      color:Colors.green
                                    )
                                  )
                                ]
                              )
                            ],),
                            ),
      ),
    );
  }
}