import 'package:brew_crew/services/auth.dart';
import 'package:flutter/cupertino.dart';
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
  String email='';
  String password='';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget. toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register Now'))
        ]
      ),
      body:  Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: Form(
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Email'
                  )
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                    password = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Password'
                  )
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  onPressed: () async{
                    print(email);
                    print(password);
                  },
                color: Colors.brown[800],
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
              ],

            )
        )
      )
    );
  }
}
