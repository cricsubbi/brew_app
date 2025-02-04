import 'package:brew_app2/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

final Function toggleView;
SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        elevation: 0.0,
        title: Text('Sign in to Brew cafe'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
          label: Text('Register'),
          onPressed: (){
            widget.toggleView();
          },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                onChanged: (val) {
                  setState(() => email = val);
                }),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onChanged: (val){setState(()=>password=val);
                } ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.pinkAccent,
              child: Text('Sign in', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                print(email);
                print(password);
              },
            )
          ],
        )),
      ),
    );
  }
}
