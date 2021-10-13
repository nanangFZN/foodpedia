import 'dart:convert';
import 'package:absensi/widgets/list_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
 final String title;

 Menu({Key key,this.title}):super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
 int count=0;
 List<dynamic> data;
   Map<String,dynamic>map;
 Future getFoods() async {
    http.Response hasil=await http.get(
      Uri.encodeFull('http://192.168.100.5:8000/api/menu/'+widget.title),headers: {
        "Accept":"application/json"
      });
      setState(() {
      map = json.decode(hasil.body);
        data=map['data'];
        count=data == null ? 0:data.length;
      });
     
      
      return json.decode(hasil.body);
  }
  @override
  void initState() {
    super.initState();
    getFoods();
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
        
        
        ListView(
          children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding:  EdgeInsets.only(left:width*0.025),
                child: Text(widget.title,
                  style:GoogleFonts.roboto(
                    fontSize: 28,
                    fontWeight:FontWeight.bold,
                    color: Colors.white
                  )
                ),
              ),
              SizedBox(height:height*0.025),
              Center(
                child: Container(
                  width: width*0.75,
                  height: height*0.075,
                  child: TextFormField(
                    decoration:InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      filled: true,
                      fillColor: Colors.white
                    )
                  ),
                ),
              ),
              SizedBox(height: height*0.025,),
              Center(
                child: Wrap(
                  children: [
                    for (var i=0;i<count;i++) 
                    ListMenu(id:data[i]['id'].toString(),title:data[i]['menu'],price:data[i]['price'].toString(),image:data[i]['image'])
                  ],),
              )
              
            ],)
          ]
        )
      )
    );
  }
}