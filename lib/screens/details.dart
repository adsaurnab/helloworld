import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/widgets/defaultwidgets.dart';

class Details extends StatefulWidget {
  static const routeName = '/details';
  var details;
   Details({Key? key, this.details}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  int currentstep =0;
@override
  void initState() {
    // TODO: implement initState
    
    var data = ApiData().getApiData();

    // print(data.)
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
          title: Text("Details of rango"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 350,

                  
                  child: Center(child: Image.network("${widget.details["imagePath"]}"))),

                  SizedBox( height: 10,),

                Container(
                  child: DefaultWidgets.featuredText("${widget.details["title"]}")
                ),

                SizedBox( height: 10,),

                Container(
                  child: Text("${widget.details["details"]}")
                ),



              ] 
              
            ),
          ),
        ),
        
      ),
    );
    
  }

  
  
}