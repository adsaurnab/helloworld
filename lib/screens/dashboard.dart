import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/widgets/appDrawer.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/screens/widgets/bottomnavigationbar.dart';
import 'package:helloworld/screens/widgets/defaultwidgets.dart';
import 'package:helloworld/screens/widgets/featuredMovie.dart';
import 'package:helloworld/screens/widgets/featuredjobs.dart';
import 'package:helloworld/screens/widgets/mycarousel.dart';

import '../utils/utils.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  void initState() {
    // TODO: implement initState
    
     data = ApiData().getApiData();

    // print(data.)
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text("Hello Good Morning"),
          actions: [
             Container(
            width: 50,
            // color: Colors.black,
            child: InkWell(
              child: const Icon(Icons.search,
                // color: Colors.red,
                size: 25,
              ),
              onTap: (){
                
                  
                
              },  
            ),
          )
          ],
        ),
        drawer: Appdrawer(),
        bottomNavigationBar: AppBottomNavigationBar(),


        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                getandsortapidata(mywidget:new mycarousel()),

                Container(
                  child: DefaultWidgets.featuredText("Featured Movie"),
                  
                  // Text("Featured Movie"),

                ),
                SizedBox(height: 20,),

                Container(
                            height: 250,
                            width: double.infinity,
                            padding: Utils.padding10_left,
                            child: 
                            // ListView(
                            //   shrinkWrap: true,
                            //   scrollDirection: Axis.horizontal,
                            //   children: [

                                getandsortapidatafeatured(mywidget:featuredWidget()),
                                // featuredWidget() 

                              // ]
                                
                                  
                                // }).toList(),
                            // )
                          ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      DefaultWidgets.featuredText("Featured Jobs"),
                      // Text("Featured Jobs"),

                      InkWell(
                        child: Row(
                          children: [
                            Text("Show All"),
                            SizedBox(width: 5,),
                            Container(
                              color: Colors.black,
                              child: Icon(Icons.arrow_right, color: Colors.white,))
                          ],
                        ),

                        onTap: (){
                              
                            },
                      )
                    ],
                  ),

                ),
                SizedBox(height: 10,),

                getandsortapidatafeaturedjobs(),





              ],
            ),

            



          ),
        ),
        )
    );
    
  }
}
