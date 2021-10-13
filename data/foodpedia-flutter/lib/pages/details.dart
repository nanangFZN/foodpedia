import 'dart:convert';

import 'package:absensi/models/foodclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class Detail extends StatefulWidget {
  final String id;
 
 Detail({Key key,this.id}):super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  static String quantity;
  
  int counter=0;
  plus(){
    setState(() {
      counter++;
      quantity=counter.toString();
    });
  }
  minus(){
    setState(() {
      if (counter != 0) {
         counter--;
         quantity=counter.toString();
      }
    });
  }


  static String menu,desc;
   static String price,id;
 Future getDetailFood() async{
   var result= await http.get(Uri.parse('http://192.168.100.5:8000/api/menu/edit/'+widget.id),headers:{"Accept": "application/json"});
    var last=(json.decode(result.body))['data'];
    if (mounted) {
     
    setState(() {
    id=last['id'].toString();  
    menu=last['menu'];
    desc=last['desc'];
    price=last['price'].toString();
    }); 
    }
    
  
   
    return json.decode(result.body);

      }
  @override
  void initState(){
    super.initState();
    getDetailFood();

  }

   
   final menuController= TextEditingController(text:id);
   TextEditingController userController= TextEditingController(text:'2');
   final qtyController= TextEditingController(text:quantity);
   final statusController= TextEditingController(text:'0');
      Future saveOrder() async{
       
                    var save=await http.post(Uri.parse('http://192.168.100.5:8000/api/menu'),body: {
                      "id_user":userController.text,
                      "id_menu":menuController.text,
                      "quantity"    :qtyController.text,
                      "status" :statusController.text,
                    },headers: {
        "Accept":"application/json"
      } );
       print(json.decode(save.body));
     
                    return json.decode(save.body);
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
           begin:Alignment.topLeft,
                end:Alignment.bottomRight,
                colors: [Color(0xFF243748),Color(0xff4b749f)]
       )
     ),
    
    child:Scaffold(
      backgroundColor: Colors.transparent,
      body:Column(
        children: [
          Container(
            width:width,
            height:height*0.4,
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.only(
                bottomLeft:Radius.circular(25),
                bottomRight:Radius.circular(25)
              ),
              image:DecorationImage(image:AssetImage('assets/main.png'),fit: BoxFit.fill)
            )
          ),
          Padding(
            padding:  EdgeInsets.only(left:width*0.025,top:height*0.015),
            child: Text('$menu',
            style:GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color:Colors.white
            )
            ),
          ),
           Padding(
            padding:  EdgeInsets.only(left:width*0.025,top:height*0.015),
            child: Text('$desc',
            style:GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:Colors.white
            )
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:width*0.025,top:height*0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Rp '+'$price',
                style:GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:Colors.white
                )
                ),
                
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:width*0.2,
                height:height*0.075,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: IconButton(
                   icon: Icon(Icons.remove,color: Colors.green,),
             onPressed: (){
               minus();
               quantity=counter.toString();
               }),
                ),
              ),
             Container(
                  width: width*0.15,
                  height: height*0.08,
                  child: TextFormField(
                    enabled: false,
                    controller: qtyController..text='$counter',
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                  
                      
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
          
             Container(
                  width:width*0.2,
                  height:height*0.075,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: IconButton(
                     icon: Icon(Icons.add,color: Colors.green,),
               onPressed: (){plus();quantity=counter.toString();}),
                  ),
                ),
           
            ],
          ),
          SizedBox(height: height*0.05,),
          Container(
            width:width*0.75,
            height:height*0.075,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:Colors.amber
              ),
              child: Text('Save',
               style:TextStyle(
                 fontSize: 28,
                 fontWeight: FontWeight.bold
               ) 
              ),
              onPressed: (){
                if (counter<=0) {
                  Alert(
                  context: context,
                  type: AlertType.error,
                  title: "Alert",
                  desc: "Please fill the quantity !",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Back",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
                }else{
                  saveOrder();
                 SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                );
                Navigator.pushNamed(context, '/home');
                
                }
             
              
             
              },
            ),
          )
        ],)
      )
    );
  }
}



