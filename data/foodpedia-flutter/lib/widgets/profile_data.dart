import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileData extends StatefulWidget {
  
  const ProfileData({Key key}) : super(key: key);

  @override
  _ProfileDataState createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  static const ADD_URL='http://192.168.100.5:8000/api/user/'; 
  static String  name , phone, email, address, username;
   
 Future getData() async {
   SharedPreferences localStorage=await SharedPreferences.getInstance();
   idUser=localStorage.getString('id_user');
   var dataUser=await http.get(ADD_URL+idUser);
   var data=(json.decode(dataUser.body)['data']);
    name=data['name'];
    phone=data['phone'].toString();
    email=data['email'];
    address=data['address'];
    username=data['username'];
    return data;
 }
   TextEditingController _name=TextEditingController(text: name);
   TextEditingController _email=TextEditingController(text:email);
    TextEditingController _phone=TextEditingController(text:phone);
     TextEditingController _address=TextEditingController(text:address);
     TextEditingController _username=TextEditingController(text:username);
   bool check=false;
   File imageFile;
   String imageData;
   String idUser;

  
choiceImage()async{
  var picked=await ImagePicker().getImage(source: ImageSource.gallery);
  if (picked != null) {
 setState(() {
    imageFile=File(picked.path);

  });
  imageData=base64Encode(imageFile.readAsBytesSync());
  return imageData;
  }else{
    return null;
  }
 
}

Future addData()async{
  var data={
    'name' : _name.text,
    'phone':_phone.text,
    'email':_email.text,
    'address':_address.text,
    'username':_username.text,
    'image':imageData
  };
  var response = await http.post(ADD_URL,body:data);
  if (response.statusCode==200) {
   print(response.body); 
  }
}

showImage(String image){
  return Image.memory(base64Decode(image));
}
 
  @override
  Widget build(BuildContext context) {
   getData();
     final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Text('Profile',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight:FontWeight.bold,
                  color: Colors.white
                ),
                ),
               Center(
                 child: InkWell(
                        onTap: (){choiceImage();},
                        child: Container(
                        width:width*0.5,
                        height:height*0.2,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image:imageData == null ? AssetImage('assets/avatar.png'):
                          FileImage(imageFile),fit:BoxFit.fill)
                        ),
                        
                      ),
                 ),
                 ),
                 
                 
               
                SizedBox(height: height*0.015,),
                Padding(
                  padding:  EdgeInsets.only(left:width*0.15),
                  child: Text('FullName',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width*0.75,
                    height: height*0.075,
                    child: TextFormField(
                   controller: _name,
                      decoration:InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5)
                        ),
                        filled: true,
                        fillColor: Colors.white
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: height*0.015,),
                Padding(
                  padding:  EdgeInsets.only(left:width*0.15),
                  child: Text('Phone',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width*0.75,
                    height: height*0.075,
                    child: TextFormField(
                   controller: _phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5)
                        ),
                        filled: true,
                        fillColor: Colors.white
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: height*0.015,),
                Padding(
                  padding:  EdgeInsets.only(left:width*0.15),
                  child: Text('Email',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width*0.75,
                    height: height*0.075,
                    child: TextFormField(
                     controller: _email,
                      decoration:InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5)
                        ),
                        filled: true,
                        fillColor: Colors.white
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: height*0.015,),
                Padding(
                  padding:  EdgeInsets.only(left:width*0.15),
                  child: Text('Address',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width*0.75,
                    height: height*0.075,
                    child: TextFormField(
                     controller: _address,
                      decoration:InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(5)
                        ),
                        filled: true,
                        fillColor: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*0.015,),
                Center(
                  child: Container(
                    width:width*0.5,
                    height:height*0.075,
                    child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary:Colors.yellow
                     ),
                      onPressed: (){
                        addData();
                      },
                       child: Text('Save',style:GoogleFonts.poppins(
                         fontSize:24,
                         fontWeight:FontWeight.bold,
                       ))),
                  ),
                )
                
              ],
              );
  }
}