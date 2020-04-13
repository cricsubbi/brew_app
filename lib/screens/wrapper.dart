import 'package:brew_app2/screens/authenticate/authenticate.dart';
import 'package:brew_app2/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_app2/models/user.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    
final user = Provider.of<User>(context);
  print(user);

    //return either Home or Authenticate widget
    if(user==null){
    return Authentication();
    }else{
      return Home();
    }

    
  }
}