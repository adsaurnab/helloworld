import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/widgets/savedmoviewidget.dart';

import '../model/ApiData.dart';

class SavedMovies extends StatefulWidget {
  static const routeName = '/savedmovies';
  const SavedMovies({Key? key}) : super(key: key);

  @override
  State<SavedMovies> createState() => _SavedMoviesState();
}

class _SavedMoviesState extends State<SavedMovies> {
  var apidata;
  getdata() async{
   apidata = await  ApiData().getApiData();
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();

  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
          title: Text("Saved Movie"),
          ),

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
          child: SingleChildScrollView(
            child: Column(

              children: [
                SavedMovie()

              ],
            )
          )
        )
      )
    );
    
  }
}