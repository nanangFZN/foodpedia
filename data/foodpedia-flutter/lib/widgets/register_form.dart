import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
    TextEditingController _nameController=TextEditingController();

    TextEditingController phone=TextEditingController();

    TextEditingController username=TextEditingController();

    TextEditingController email=TextEditingController();

    TextEditingController pass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
  
    Future userRegist() async{
      var regist=await http.post(Uri.parse('http://192.168.100.5:8000/api/menu/register'),body: {
        'name':_nameController.text,
        'phone':phone.text,
        'username':username.text,
        'email':email.text,
        'password':pass.text,
      },headers: {
        "Accept":"application/json"
      });
      
      return json.decode(regist.body);
    }
    return Column(
      children: [
        Container(
                      width: width*0.5,
                      height:height*0.2,
                      decoration: BoxDecoration(
                        image:DecorationImage(image:AssetImage('assets/login.png'))
                      ),
                    ),
                     Text('Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                Text('FoodPedia',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                 SizedBox(height:height*0.015),
                Container(
                  width: width*0.75,
                  height: height*0.08,
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.people),
                      labelText: 'FullName',
                      
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                       filled: true,
                        fillColor: Colors.white
                    ),
                  )),
                   SizedBox(height:height*0.015),
                Container(
                  width: width*0.75,
                  height: height*0.08,
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone',
                      
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                       filled: true,
                        fillColor: Colors.white
                    ),
                  )),
                   SizedBox(height:height*0.015),
                Container(
                  width: width*0.75,
                  height: height*0.08,
                  child: TextFormField(
                    controller:username,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Username',
                      
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                       filled: true,
                        fillColor: Colors.white
                    ),
                  )),
                   SizedBox(height:height*0.015),
                   Container(
                  width: width*0.75,
                  height: height*0.08,
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                       filled: true,
                        fillColor: Colors.white
                    ),
                  )),
                  SizedBox(height:height*0.015),
                   Container(
                  width: width*0.75,
                  height: height*0.08,
                  child: TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(25)
                      ),
                       filled: true,
                        fillColor: Colors.white
                    ),
                  )),
                  SizedBox(height:height*0.015),
                   Container(
                           width: width*0.5,
                           height: height*0.075,
                        
                           child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                             primary:Colors.amber
                             ),
                             onPressed: (){
                              userRegist();
                               Navigator.pushNamed(context, '/home');
                             },
                              child: Text('Sign Up',style:GoogleFonts.poppins(
                                fontSize:24,
                                fontWeight: FontWeight.bold,
                              ))),
                         ),

                         TextButton(
                           onPressed: (){
                           
                             Navigator.pushNamed(context, '/login');
                           },
                            child:Text('Already Have Account ? Sign In') 
                         )
      ],

               
    );
  }
}