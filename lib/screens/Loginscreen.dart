import 'package:doc/screens/loginvalidator/LoginValidation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));





class _LoginState extends State<Login> with LoginValidation {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _userName;
  String _password;
  bool _acceptterms = false;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(children: [
            Container(
//              width: 220.0,
              margin: EdgeInsets.fromLTRB(_size.width*0.05, _size.width*0.05, _size.width*0.05, _size.width*0.01),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(_size.width*0.03, _size.height*0.1, _size.width*0.03, _size.height*0.1),
                    child: Center(
                      child: Text('Login',
                        style: new TextStyle(
                            fontSize: _size.width*0.08,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: _size.width*0.9,

                        child: TextFormField(
                          validator: emailValidation,
                          onSaved: (String value) {
                            setState(() {
                              _userName = value;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(_size.width*0.025))),
                            hintText: 'UserName',
                            labelText: 'UserName',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.03,
                      ),
                      Container(
                        width: _size.width*0.9,
                        child: TextFormField(
                          validator: passwordValidation,
                          onSaved: (String value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(_size.width*0.025))),
                            hintText: 'Password',
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                        GradientButton(
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(FocusNode());
                            if (_formKey.currentState.validate() &&
                                _acceptterms == true) {
                              _formKey.currentState.save();
                              print(
                                  '$_acceptterms,usr:$_userName,pass:$_password');
//                              Navigator.pushReplacementNamed(context, '/products');
                              FocusScope.of(context)
                                  .requestFocus(FocusNode());
                            }
                          },
                            title: 'Login',
                          width: _size.width*0.9,
                          height: _size.height*0.078,
                        ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                    ],
                  ),
                ],
              ),
//              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(_size.width*0.05, _size.width*0.02, _size.width*0.05, _size.width*0.03),

//              height: 300.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _size.height*0.09,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: _size.width*0.01,
                      ),
                      Text(
                        'Login with',
                        style: new TextStyle(
                            fontSize: _size.width*0.051,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),

                      ),
                    ],
                  ),
                  SizedBox(
                    height: _size.height*0.01,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  SizedBox(
                    height: _size.height*0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: _size.width*0.05,
                      ),
                      Container(
                          width:50.0,
                          height:50.0,
//                        width: _size.width*0.130,
//                        height: _size.width*0.13,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/facebook .png'),
                              fit: BoxFit.fill),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(
                        width: _size.width*0.09,
                      ),
                      Container(
                          width: 50.0,
                          height: 50.0,
//                        width: _size.width*0.130,
//                        height: _size.width*0.13,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/google-plus.png'),
                              fit: BoxFit.scaleDown),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),

                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {

  const GradientButton({
    Key key,
    @required this.onPressed,
    @required this.title,
    @required this.width,
    @required this.height
  }) : super(key: key);

  final  Function onPressed;
  final String title;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      splashColor: Colors.lightBlue.withOpacity(0.5),
      onPressed: onPressed,
      child: Container(
        child: Center(child:
        Text(title,style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
        ),)),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          gradient: new LinearGradient(
            colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
          ),
        ),

      ),
    );
  }
}
