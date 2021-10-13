import 'package:absensi/models/user.dart';
import 'package:absensi/widgets/category.dart';
import 'package:absensi/widgets/topmenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatelessWidget {
 
 
  @override
  Widget build(BuildContext context) {
      final arguments = ModalRoute.of(context).settings.arguments as List;
     var name=arguments[1]; 
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient:LinearGradient(
         begin:Alignment.topLeft,
                end:Alignment.bottomRight,
                colors: [Color(0xFF243748),Color(0xff4b749f)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
              Row(
                children: [
                  Container(
                    width:width*0.25,
                    height:height*0.1,
                    decoration:BoxDecoration(
                      color:Colors.green,
                      shape: BoxShape.circle,
                      image: DecorationImage(image:AssetImage('assets/logo.png'))
                    )
                  ),
                  Text('FoodPedia',style:GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                  ))
                ],
              ),
              SizedBox(height:height*0.025),
              Center(
                child: Container(
                  width:width*0.75,
                  height:height*0.075,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      focusedBorder:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(25) ,
                      
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(25)
                        ),
                        filled: true,
                        fillColor: Colors.white
                    ),
                    
                  ),
                ),
              ),
              SizedBox(height:height*0.025),
              Padding(
                padding:  EdgeInsets.only(left:width*0.025),
                child: Text('Hi, '+name,
                style:GoogleFonts.roboto(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                  color:Colors.white
                )),
              ),
              Padding(
                padding:  EdgeInsets.only(left:width*0.025),
                child: Text('Welcome Back!',
                style:GoogleFonts.roboto(
                  fontSize:16,
                  fontWeight: FontWeight.w400,
                  color:Colors.white
                )),
              ),
              SizedBox(height:height*0.025),
              Row(
                children:[
                 Categories(title:'Drink',image:'assets/drinks.png'),
                  Categories(title:'Main Course',image:'assets/main.png'),
                  Categories(title:'Desserts',image:'assets/desert.png')
                ]
              ),
              SizedBox(height:height*0.025),
              Padding(
                padding:  EdgeInsets.only(left:width*0.025),
                child: Text('Top Menu',
                style:GoogleFonts.roboto(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ) ,),
              ),
              Padding(
                padding:  EdgeInsets.only(left:width*0.025,top:height*0.025),
                child: SingleChildScrollView(
                    child: Center(
                      child: Wrap(
                   
                      children: [
                       
                          TopMenu(
                          image:'assets/main.png',
                          title:'Bakmie Goreng Spesial AYam Bawang',
                          price:'Rp 22.000'
                          ),
                          TopMenu(
                           image:'assets/desert.png',
                           title:'Bakmie Goreng Spesial AYam Bawang',
                           price:'Rp 20.000'
                           ),
                           TopMenu(
                           image:'assets/desert.png',
                           title:'Bakmie Goreng Spesial AYam Bawang',
                           price:'Rp 20.000'
                           ),
                            TopMenu(
                           image:'assets/desert.png',
                           title:'Bakmie Goreng Spesial AYam Bawang',
                           price:'Rp 20.000'
                           ),
                      ],
                  ),
                    ),
                ),
              )

              ]
            ),
          ],
        ),
      ),
    );
  }
}