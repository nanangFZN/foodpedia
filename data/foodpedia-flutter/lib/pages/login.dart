import 'dart:convert';

import 'package:absensi/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 TextEditingController username=TextEditingController();

 TextEditingController pass=TextEditingController();

 Future userLogin() async {
   if (username.text.isEmpty||pass.text.isEmpty) {
     Alert(
       context: context,
        title: 'Please Fill The Form !',type: AlertType.error).show();
        return;
   }
      final login=await http.post(Uri.parse('http://192.168.100.5:8000/api/menu/login'),body: {
          'username':username.text,
          'password':pass.text
        });
        var data=json.decode(login.body);
       
        if (login.statusCode==200) {
         var user=(data['data']['user']);
        var name=user['name'];
        var phone=user['phone'];
        var idUser=user['id'].toString();
          final list=[idUser,name,phone];
        SharedPreferences localStorage=await SharedPreferences.getInstance();
        localStorage.setString('id_user', idUser);
        

        
         Navigator.pushNamed(context, '/home',arguments: list);
        }else  {
           Alert(context: context, title: 'Invalid Password or Username',type: AlertType.error).show();
          
        }
         
         
   
  
 }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children:[
            Container(
              width:width,
              height:height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin:Alignment.topLeft,
                  end:Alignment.bottomRight,
                  colors: [Color(0xFF243748),Color(0xff4b749f)]
                )
              ),
              child: Column(
                children:[
                  SizedBox(height:height*0.075),
                  Container(
                    width: width*0.5,
                    height:height*0.2,
                    decoration: BoxDecoration(
                      image:DecorationImage(image:AssetImage('assets/login.png'))
                    ),
                  ),
                  Text('Sign In',
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
                     SizedBox(height:height*0.025),
                  Container(
                    width: width*0.75,
                    height: height*0.08,
                    child: TextFormField(
                      controller: username,
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
                    SizedBox(height:height*0.025),
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
                    SizedBox(height:height*0.025),
                     Container(
                             width: width*0.5,
                             height: height*0.075,
                          
                             child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                               primary:Colors.amber
                               ),
                               onPressed: (){
                                 userLogin();
                               },
                                child: Text('Login',style:GoogleFonts.poppins(
                                  fontSize:24,
                                  fontWeight: FontWeight.bold,
                                ))),
                           ),

                           TextButton(
                             onPressed: (){
                               Navigator.pushNamed(context, '/register');
                             },
                              child:Text('Dont Have Account ? Sign Up Here') )
                ]
              ),
            )
          ]
        ),
      ),
    );
  }
}