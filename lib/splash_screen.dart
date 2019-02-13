import 'package:doc/main.dart';
import 'package:doc/screens/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {


  Widget showErorCard(){

    return Material(
      child: Container(
        width: 120.0,
        height: 120.0,

        child: AlertDialog(
          content: Text('Its erorr in loading check your network'),
          actions: <Widget>[
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('Ok'))
          ],
        ),
      ),
    );
  }

  void fun(){
   setState(() {

   });
  }


  Future<Post> post;
  AnimationController _controller;
  Animation<double> animation;
  Future<Post> fetchPost() async {

     final response =
     await http.get('https://jsonplaceholder.typicode.com/posts/1');

     if (response.statusCode == 200) {
       // If server returns an OK response, parse the JSON
//      print('sucesses'+jso
// n.decode(response.body));
       return Post.fromJson(json.decode(response.body));
     } else {
       // If that response was not OK, throw an error.
       throw Exception('Failed to load post');
     }

  }

//  @override
//  void didChangeDependencies() {
//    fetchPost();
//    super.didChangeDependencies();
//  }

  @override
  void initState() {
    post=fetchPost();
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
  Widget build(BuildContext context) {
   final  double width= MediaQuery.of(context).size.width;
   final  double height= MediaQuery.of(context).size.height;
    return FutureBuilder<Post>(
      future: fetchPost(),
      builder: (context, snapshot) {
        // if (snapshot.hasError) {
        //   //_controller.dispose();
        //   return showErorCard();
        // }
        if (snapshot.hasData) {
          if(snapshot.data==null){
              print('has no Error and no dataRR');
            return FirstScreen(hasError: false,);
          }
          /// here we need to send to the DashBoard Page
          /// Note this is based on this future  **
          return  Login();
        }
        if(!snapshot.hasData&&snapshot.hasError){
          print('has Error');
          return FirstScreen(hasError: true);
        }
        return  SplashScreent(controller: _controller, width: width, height: height);
      },
    );
  }
}

class SplashScreent extends StatelessWidget {
  const SplashScreent({
    Key key,
    @required AnimationController controller,
    @required this.width,
    @required this.height,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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
//new SplashScreent(controller: _controller, width: width, height: height);
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}


