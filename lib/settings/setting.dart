import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() {
    return new SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool status=false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8)).whenComplete((){
      setState(() {
        status=true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    Size _size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Center(
                child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    CircleAvatar(
                      radius: 60.0,
                      foregroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.blue,
//                  foregroundColor: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Edit the Name',
                      style: TextStyle(
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20.0,
              color: Colors.blue[50].withOpacity(0.7),
            ),
            Container(
              color: Colors.white,
              child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Basic Information',
                    style: TextStyle(
                      fontSize: 15.0,
                      textBaseline: TextBaseline.ideographic,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Divider(),
                  status?
                  Container(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Regonda Puneeth',
                              style: TextStyle(
                                fontSize: 17.0,
                                letterSpacing: 1.0,

                              ),
                            ),
                          ],
                        ),
                        height: 40.0,
                      ),
                    ),
                  ):
                  ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.email),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Puneethregonda@gmail.com',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                          ),
                          )
                        ],
                      ),
                    ),
                  )
                      :ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '+91 94410 95948',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ):ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('20-09-18',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ):ListTileCustome(),
                  Divider(),
                  status?
                  Container(
                    height: 50.0,
                    child: ListTile(
                      leading: Icon(Icons.person_pin_circle),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Male',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 17.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ):ListTileCustome(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileCustome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Container(
         child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: Container(
                ),
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 10.0,
                    color: Colors.blue[50].withOpacity(0.9),
                  ),
                  Container(
                    width: 180.0,
                    height: 10.0,
                    color: Colors.blue[50].withOpacity(0.7),
                  ),

                ],
              ),
            ],
          ),
          height: 30.0,
        ),
      ),
    );
  }
}
