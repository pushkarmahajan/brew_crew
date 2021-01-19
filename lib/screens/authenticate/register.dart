import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
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
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email='';
  String password='';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign Up to Brew Crew'),
            actions: [
              FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Sign In'))
            ]
        ),
        body:  Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20.0,),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      decoration: textFormField.copyWith(hintText: "Email"),
                    ),
                    SizedBox(height: 20.0,),
                    TextFormField(
                      obscureText: true,
                      validator: (val) => val.length < 6 ? "Password must be atleast 7 characters" : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      decoration: textFormField.copyWith(hintText: "Password"),
                    ),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      onPressed: () async{
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await  _auth.registerWithEmailAndPassword( email, password);
                          if(result == null){
                              setState(() {error = 'please supply a valid email';
                              loading = false;
                              });
                          }
                        }
                      },
                      color: Colors.brown[800],
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                    )
                    )

                  ],

                )
            )
        )
    );
  }
}
