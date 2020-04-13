import 'package:brew_app2/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context){
    return Scaffold( backgroundColor: Colors.brown[300],
      appBar: AppBar(backgroundColor: Colors.brown[900],
      elevation: 0.0,
      title: Text(' Brew cafe'),
      actions: <Widget>[
        FlatButton.icon(icon: Icon(Icons.person),
         label: Text('logout'),
         onPressed: ()async{
           await _auth.signOut();
           },
         )
      ],
      ),
    );
  }
}