import 'package:doc/screens/Loginscreen.dart';
import 'package:doc/screens/SignUp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: FirstScreen(),
      showPerformanceOverlay: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    ));

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() {
    return new FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
 Animation<double> animation ;

  @override
  void initState() {

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
   _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromRGBO(57, 160, 205, 1),
            Color.fromRGBO(5, 193, 154, 1)
          ],
        )),
        child: FadeTransition(
            opacity: _controller,
          child: BodyLayOut(),
        )
      ),
    );
  }
}

class BodyLayOut extends StatelessWidget {
  const BodyLayOut({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage('assets/FirstScreen.PNG'),
                fit: BoxFit.fitHeight),
          ),
//            child:  Center(child: Image.asset('assets/FirstScreen.PNG')),
//              width: double.infinity,
          height: 350.0,
        ),
        SizedBox(
          height: 100.0,
        ),
        Column(
          children: <Widget>[
            GradientButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SignIn()));
                },
                title: 'Sign in',
                width: 350.0,
                height: 60.0),
            SizedBox(
              height: 10.0,
            ),
            GradientButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                },
                title: 'Login',
                width: 350.0,
                height: 60.0),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ],
    );
  }
}

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key key,
      @required this.onPressed,
      @required this.title,
      @required this.width,
      @required this.height})
      : super(key: key);

  final Function onPressed;
  final String title;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10.0,
      splashColor: Colors.lightBlue.withOpacity(0.5),
      onPressed: onPressed,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            foreground: Paint()..shader = linearGradient,
//            color: Colors.white
          ),
        )),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
//          gradient: new LinearGradient(
//            colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
//          ),
        ),
      ),
    );
  }
}
