import 'package:brew_crew/screens/home/setting_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/services/database.dart';
import "package:brew_crew/screens/home/brew_list.dart";
import "package:brew_crew/models/brew.dart";

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.all(20.0),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation:  0.0,
          actions: [
            FlatButton.icon(
                onPressed: () => _showSettingPanel() ,
                icon: Icon(Icons.settings_rounded),
                label: Text("Settings")
            ),
            FlatButton.icon(onPressed: () async{
              await _auth.sgnOut();
            },
                icon: Icon(Icons.person),
                label: Text('Logout'))
          ],
      ),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/coffee_bg.png'),
                  fit: BoxFit.cover,
                )
              ),
              child:BrewList()
          ),
    )
    );
  }
}

