import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key key}) : super(key: key);

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
      ),
    );
  }
}