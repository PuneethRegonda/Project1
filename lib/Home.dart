import 'package:doc/screens/about.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>About()));
              },
            )
          ],
        ) ,
      ),
      body: Container(
        child: Center(child: Text('Hello Boy')),
      ),
    );
  }
}
