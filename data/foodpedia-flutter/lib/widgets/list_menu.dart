import 'package:absensi/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListMenu extends StatelessWidget {
 // const ListMenu({Key key}) : super(key: key);
  final String id;
  final String image;
  final String title;
  final String price;
  ListMenu({this.image,this.price,this.title,this.id});

  @override
  Widget build(BuildContext context) {
     final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return  Padding(
                      padding:  EdgeInsets.all(width*0.025),
                      child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(id: id,)));
                          },
                           child: Container(
                          width:width*0.45,
                          height:height*0.3,
                          decoration:BoxDecoration(
                            color:Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            border:Border.all(width:2,color:Colors.white)
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width:width*0.35,
                                height:height*0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)
                                ),
                              ),
                              SizedBox(height:height*0.015),
                              Text(title,
                            textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color:Colors.white
                              )
                              ),
                               Text('Rp. '+price,
                            textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                              )
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    );
  }
}