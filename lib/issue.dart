import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    home: Splash(),
  ));
}
class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: height*1/10,),
          SizedBox(height: height*2/10,),
          Center(child: CircularProgressIndicator(),)

        ],
      ),
    );
  }
}