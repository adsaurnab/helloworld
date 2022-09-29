import 'package:flutter/material.dart';
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/chooseIntrest.dart';
import 'package:helloworld/screens/dashboard.dart';
import 'package:helloworld/screens/signup.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
    child: Column(
      children: <Widget>[
        AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          title: Center(child: Text('App')),
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        ListTile(
          leading: Icon(
            Icons.dashboard,
          ),
          title: Text("Dashboard"),
          onTap: () {
            Navigator.of(context)
                .pushNamed(Dashboard.routeName);
          },
        ),

        ListTile(
          leading: Icon(
            Icons.movie,
          ),
          title: Text("All Movies"),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AllMovies.routeName);
          },
        ),

        ListTile(
          leading: Icon(
            Icons.check,
          ),
          title: Text("Choose Interest"),
          onTap: () {
            Navigator.of(context)
                .pushNamed(ChooseIntrest.routeName);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.app_registration,
          ),
          title: Text("Sign Up"),
          onTap: () {
            Navigator.of(context)
                .pushNamed(Signup.routeName);
          },
        ),
      ])));
  }
}