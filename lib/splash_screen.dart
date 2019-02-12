import 'package:doc/main.dart';
import 'package:doc/screens/settings.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward().whenComplete((){
           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Setting()));
        //print('is completed :${animation.status}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final  double width= MediaQuery.of(context).size.width;
   final  double height= MediaQuery.of(context).size.height;
    return MaterialApp(

      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
            ),
          ),
          child: FadeTransition(
              opacity: _controller,
            child: Center(
              child: Container(
                  width: width*8/10,
                  height: height*5/10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('assets/FirstScreen.PNG'),
                      ),
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
