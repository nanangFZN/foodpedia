import 'package:absensi/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

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
                  RegisterForm()
                ]
              ),
            )
          ]
        ),
      ),
    );
  }
}