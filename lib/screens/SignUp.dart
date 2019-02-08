import 'package:doc/screens/loginvalidator/LoginValidation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInState();
  }
}

final Shader linearGradient = LinearGradient(
  colors: [Color.fromRGBO(57, 160, 205, 1), Color.fromRGBO(5, 193, 154, 1)],
).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

class _SignInState extends State<SignIn> with LoginValidation {
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
              margin: EdgeInsets.fromLTRB(_size.width*0.05, _size.width*0.001, _size.width*0.05, _size.width*0.001),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(_size.width*0.03, _size.height*0.04, _size.width*0.03, _size.height*0.07),
                    child: Center(
                      child: Text('Sign in',
                        style: new TextStyle(
                            fontSize: _size.width*0.08,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        validator: emailValidation,
                        onSaved: (String value) {
                          setState(() {
                            _userName = value;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(_size.width*0.025))),
                          hintText: 'FullName',
                          labelText: 'FullName',
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.03,
                      ),
                      TextFormField(
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
                          hintText: 'Email ID ',
                          labelText: 'Email ID',
                        ),
                      ),

                      SizedBox(
                        height: _size.width*0.03,
                      ),
                      TextFormField(
                        validator: passwordValidation,
                        onSaved: (String value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        obscureText: true,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(_size.width*0.025))),
                          hintText: 'Phone',
                          labelText: 'Phone',
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.03,
                      ),
                      TextFormField(
                        validator: passwordValidation,
                        onSaved: (String value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(_size.width*0.025))),
                          hintText: 'Password',
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(
                        height: _size.width*0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
//                          SizedBox(
//                            width: 240,
//                          ),
                          GradientButton(
                            onPressed: () {
                              FocusScope.of(context)
                                  .requestFocus(FocusNode());
                              if (_formKey.currentState.validate() &&
                                  _acceptterms == true) {
                                _formKey.currentState.save();
                                print(
                                    '$_acceptterms,usr:$_userName,pass:$_password');
//                        Navigator.pushReplacementNamed(context, '/products');
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                              }
                            },
                              title: 'Register',
                            width: _size.width*0.9,
                            height: _size.height*0.078,
                          ),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(_size.width*0.05, _size.width*0.02, _size.width*0.05, _size.width*0.03),

//              height: 300.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: _size.width*0.01,
                      ),
                      Text(
                        'Sign in with',
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
                        width: 50.0,
                        height: 50.0,
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
                        height:50.0,
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
