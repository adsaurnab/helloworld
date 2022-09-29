import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/widgets/appDrawer.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [

                getandsortapidata(),

        Container(
          child: Text("Featured Movie"),

        ),

        Container(
                    height: 150,
                    padding: Utils.padding10_left,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: []
                        // data.map((text){ 
                        //   return Container(
                        //     margin: Utils.padding10_left_right,
                            
                        //     width: 250,
                        //     height: 150,
                        //     decoration: BoxDecoration(
                        //       color: Colors.grey,
                        //       borderRadius: BorderRadius.circular(10)
                        //     ),
                        //     child: ClipRRect(
                        //       borderRadius: BorderRadius.circular(10),
                        //       child: Image.asset(text)
                        //     ),
                        //   );
                          
                        // }).toList(),
                    )
                  ),

                
              ],
            ),

            



          ),
        ),
        )
    );
    
  }
}

class getandsortapidata extends StatelessWidget {
  const getandsortapidata({
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

    return  mycarousel(response: response);

        }});
  }
}

class mycarousel extends StatelessWidget {
  final  response;
  const mycarousel({
    @required this.response,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30

      ),
      child: Container(
        width: double.infinity,
        child: CarouselSlider.builder(
          
          itemCount: response.data.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>

          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  child: Center(
                    child: Image.network(
                    
                      response.data[itemIndex]["imagePath"],

                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  child: Text(
                    "${response.data[itemIndex]['title']}"
                  ),
                )
              ],
            ),
          ),
          
          
         
          
          options: CarouselOptions(
              height: 250,
              // aspectRatio: 8/2,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 20),
              autoPlayAnimationDuration: Duration(seconds:1),
              autoPlayCurve: Curves.fastOutSlowIn,
              // enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
          )
        ),
      ),
    );
  }
}

