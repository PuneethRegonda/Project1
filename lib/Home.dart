import 'package:doc/settings/setting.dart';
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
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SettingsPage()));
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
