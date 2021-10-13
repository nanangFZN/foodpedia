import 'dart:convert';

import 'package:absensi/models/user.dart';
import 'package:absensi/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var test=0;
  static String iduser;
Future getShared() async {
  SharedPreferences localStorage=await SharedPreferences.getInstance();
  setState((){
   iduser= localStorage.getString('id_user').toString();
  });
}
Future fetchData()async{
  var cart=await http.get(Uri.parse('http://192.168.100.5:8000/api/menu/cart/'+iduser));
 var history=json.decode(cart.body);
 var cek=history['data'];
 List list=cek;
 return json.decode(cart.body);
}
@override
void initState(){
  super.initState();
  getShared();

}

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient:LinearGradient(
          begin:Alignment.topCenter,
          end:Alignment.bottomCenter,
          colors:[Color(0xff434343),Color(0xff000000)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
             
              FutureBuilder(
                future: fetchData(),
                builder:(context,snapshot){
                  if (snapshot.hasData) {
                    return ListView(
                      
                      children: [
                        Text('Your Order',
              style:GoogleFonts.roboto(
                fontSize:26,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: snapshot.data['data'].length,
                          itemBuilder: (context,i){
                            return CartList(
                              title: snapshot.data['data'][i]['menu'],
                              price:snapshot.data['data'][i]['price'].toString(),
                              quantity:snapshot.data['data'][i]['quantity'].toString(),
                              status:snapshot.data['data'][i]['status'] !=0 ? 'Success' : 'On Progress'
                              );
                          }),
                      ],
                    );
                  }else{
                     return SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.red : Colors.green,
      ),
    );
  },
);
                  }
                }
                )
               
          
       
      ),
    );
  }
}