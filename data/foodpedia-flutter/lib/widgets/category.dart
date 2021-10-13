import 'package:absensi/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatelessWidget {

 final String title ;
 final String image;

 Categories({this.title,this.image});
 
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return  
                     Column(
                    children:[
                  
                      Padding(
                        padding:  EdgeInsets.only(left:width*0.025),
                        child:  InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu(title: title,)));
                          },
                               child: Container(
                              width:width*0.3,
                              height:height*0.15,
                              decoration:BoxDecoration(
                                color:Colors.yellow,
                                shape:BoxShape.circle,
                                image: DecorationImage(image: AssetImage(image))
                              )
                            ),
                        ),
                        ),
                      
                      Text(title,style:GoogleFonts.roboto(
                        fontSize:16,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                      ))
                    ]
                  
    );
  }
}