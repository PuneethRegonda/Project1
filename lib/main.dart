import 'package:doc/screens/Loginscreen.dart';
import 'package:doc/screens/SignUp.dart';
import 'package:doc/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
            ),
          ),
          child: SplashScreen(),
        ),
      ),
      showPerformanceOverlay: false,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    ));

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class FirstScreen extends StatefulWidget {

  final bool hasError;
  FirstScreen({@required this.hasError});
  @override
  FirstScreenState createState() {
    return new FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen>
    with TickerProviderStateMixin {
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
    _controller.forward();
    super.initState();
  }

 @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.white,
          width: double.infinity,
//        decoration: BoxDecoration(
//            gradient: LinearGradient(
//          colors: [
//            Color.fromRGBO(57, 160, 205, 1),
//            Color.fromRGBO(5, 193, 154, 1)
//          ],
//        )),
          child: FadeTransition(
            opacity: _controller,
            child: BodyLayOut(),
          )),
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
        Expanded(
          flex: 2,
          child: SizedBox(
            child: Container(
              child: Text("Welcome"),
            ),
          ),
        ),
        GradientButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SignUp()));
            },
            title: ' Signup ',
            width: 350.0,
            height: 60.0,
        isgradientcolor: true,
        ),
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
          height: 60.0,
          isgradientcolor: false,
        ),
        SizedBox(
          height: 10.0,
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
      @required this.height,
      @required this.isgradientcolor,

      })
      : super(key: key);

  final Function onPressed;
  final String title;
  final double width;
  final double height;
  final bool isgradientcolor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0)
      ),
      elevation: isgradientcolor?10.0:10.0,
      highlightColor: Colors.white,
//      splashColor: Color.fromRGBO(5, 193, 154, 1),
      onPressed: onPressed,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            letterSpacing: 1.0,
              fontSize: 20.0,
//            foreground: Paint()..shader = linearGradient,
              color: isgradientcolor?Colors.white:Colors.black,
          ),
        )),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isgradientcolor?null:Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 3.0),
              blurRadius: 5.0,
            ),
          ],




          border: isgradientcolor?null:Border.all(
            width: 0.5,
          style: BorderStyle.solid,
          color: Colors.grey,
          ),
//          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          shape: BoxShape.rectangle,
          gradient: isgradientcolor?new LinearGradient(
            colors: [
              Color.fromRGBO(57, 160, 205, 1),
              Color.fromRGBO(5, 193, 154, 1)
            ],
          ):null
        ),
      ),
    );
  }
}
