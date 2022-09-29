import "package:flutter/material.dart";
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/dashboard.dart';
import 'package:helloworld/screens/savedmovies.dart';

class AppBottomNavigationBar extends StatefulWidget {
  var screenNum;
  AppBottomNavigationBar({this.screenNum});

  @override
  _AppBottomNavigationBarState createState() =>
      _AppBottomNavigationBarState(screenNum: this.screenNum);
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  var screenNum;
  int? _selectedIndex;
  Color? selectedcolor;

  late int _selectedIndexValue;
  TextStyle optionStyle = TextStyle(fontSize: 15);
  

  _AppBottomNavigationBarState({this.screenNum}) {
    this._selectedIndex = screenNum;
    if (_selectedIndex == null) {
      _selectedIndex = 0;
       _selectedIndexValue = 0;
      selectedcolor = Colors.blue;
      this.optionStyle = TextStyle(fontSize: 15);
    } else {
      _selectedIndexValue = screenNum;
      selectedcolor = Colors.blue;
      this.optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.of(context).pushNamed(Dashboard.routeName);
      }
      if (index == 1) {
        Navigator.of(context)
            .pushNamed(AllMovies.routeName);
      }

      if (index == 2) {
        Navigator.of(context).pushNamed(SavedMovies.routeName);
      }

      _selectedIndex = index;
      _selectedIndexValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String dashboard = "Dashboard";

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Dashboard"
              
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "Favourite"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:"saved"
        ),
      ],
      currentIndex: _selectedIndex!,
      selectedItemColor: selectedcolor,
      onTap: _onItemTapped,
    );
  }
}
