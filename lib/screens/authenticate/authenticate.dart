import 'package:brew_app2/screens/authenticate/register.dart';
import 'package:brew_app2/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


class Authentication extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
    return _Authentication();
  }
}

class _Authentication extends State<Authentication>{
bool showSignIn = true;
void toggleView(){
  setState(()=> showSignIn = !showSignIn);
}

  @override
  Widget build(BuildContext context){
       if(showSignIn){
        return SignIn(toggleView: toggleView);
        }
        else{
            return Register(toggleView: toggleView);
        }
    
  }
}