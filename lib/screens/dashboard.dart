import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/widgets/appDrawer.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/screens/widgets/featuredMovie.dart';
import 'package:helloworld/screens/widgets/mycarousel.dart';

import '../utils/utils.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/';
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
        appBar: AppBar(title:Text("Hello Good Morning")),
        drawer: Appdrawer(),


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
                  child: Text("Featured Movie"),

                ),

                Container(
                            height: 350,
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
                      Text("Featured Jobs"),

                      Row(
                        children: [
                          Text("Show All"),
                          SizedBox(width: 5,),
                          Container(
                            color: Colors.black,
                            child: Icon(Icons.arrow_right, color: Colors.white,))
                        ],
                      )
                    ],
                  ),

                ),





              ],
            ),

            



          ),
        ),
        )
    );
    
  }
}

class getandsortapidatafeaturedjobs extends StatelessWidget {
  
  const getandsortapidatafeaturedjobs({
    
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiData().getApiData(),
      builder: (BuildContext context, AsyncSnapshot response) {
        if (response.data == null) {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          

          return ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: response.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  featuredWidget(response:  response.data[index]);
                        });
        }
      }
    );
                          

                       

    
  }
}

class featuredJobsWidget extends StatelessWidget {
  var  response;
   featuredJobsWidget({
    this.response,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.star),
              SizedBox(width: 5,),
              Text("9.2")
            ],
          ),

          Container(
            height: 150,
            child: Image.network(response["imagePath"])),

          Container(
            // width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Text("Year: 2004"),

                Icon(FontAwesomeIcons.heart),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

