import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  final double circleRadius = 150.0;
  final double circleBorderWidth = 4.0;
  @override
  Widget build(BuildContext context) {
    Size _size=MediaQuery.of(context).size;
    return Material(
      child: Container(
        child: Center(
          child: new TestExtract(circleRadius: circleRadius, circleBorderWidth: circleBorderWidth),
        ),
        color: Colors.blue,
        margin: EdgeInsets.fromLTRB(_size.width*0.05, _size.width*0.02, _size.width*0.05, _size.width*0.03),
      ),
    );
  }
}

class TestExtract extends StatelessWidget {
  const TestExtract({
    Key key,
    @required this.circleRadius,
    @required this.circleBorderWidth,
  }) : super(key: key);

  final double circleRadius;
  final double circleBorderWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration:
          ShapeDecoration(shape: CircleBorder(), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Profilepic.jpg'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ContainerWithCircle extends StatelessWidget {

  final double circleRadius = 150.0;
  final double circleBorderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: circleRadius,
          height: circleRadius,
          decoration:
          ShapeDecoration(shape: CircleBorder(), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(circleBorderWidth),
            child: DecoratedBox(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Profilepic.jpg'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget BoxLogoGradient() {
  return Center(
    child: new Container(
        decoration: new BoxDecoration(
          color: Colors.purple,
          gradient: new LinearGradient(
            colors: [Colors.red, Colors.cyan],
          ),
        ),
        child: new FlutterLogo(
          size: 200.0,
        )),
  );
}
