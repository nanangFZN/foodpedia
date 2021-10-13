import 'dart:convert';

import 'package:http/http.dart' as http;

class DetailFood {
   String menu,desc,price,image;
  DetailFood({this.menu,this.desc,this.price,this.image});
  final String url="http://192.168.100.5:8000";
  static Future<DetailFood> getDetail(String id) async{
    var response=await http.get(Uri.parse("http://192.168.100.5:8000/api/menu/edit/"+id));
    var data=(json.decode(response.body))['data'];
    return DetailFood(
      menu: data['menu'],
      desc: data['desc'],
      price: data['price'].toString(),
      image: data['image'],
    );
  }
}