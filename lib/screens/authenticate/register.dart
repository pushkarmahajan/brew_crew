import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {

    final Function toggleView;
    Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
          title: Text('Sign Up to Brew Crew'),
            actions: [
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person),
                  label: Text('Sign In'))
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
                        "Register",
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
