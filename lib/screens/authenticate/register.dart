import 'package:flutter/material.dart';
import 'package:brew_app2/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Register extends StatefulWidget {

  final Function toggleView;
Register({this.toggleView});
  
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  
  //text field state
  String email = '';
  String password = '';
  String name = '';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0.0,
        title: Text('Sign up to Brew cafe'),
         actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
          label: Text('Sign In'),
          onPressed: (){
            widget.toggleView();
          },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                validator: (val)=>val.isEmpty? 'enter your name':null,
                decoration: InputDecoration(hintText: "Name"),
                onChanged: (val) {
                  setState(() => name = val);
                }),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                validator: (val)=>val.isEmpty? 'enter an email':null,
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  setState(() => email = val);
                }),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                validator: (val)=>val.length < 6 ? 'enter an password 6+ chars long':null,
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onChanged: (val){setState(()=>password=val);
                } ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.pinkAccent,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                if(_formKey.currentState.validate()){
               http.Response res = await http.post('https://subtask-boy.herokuapp.com/users',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name':name,
      'email':email,
      'password':password,
    }),
  );
  Map data = json.decode(res.body);
  print(data);
              }
              })
          ],
        )),
      ),
    );
  }
}