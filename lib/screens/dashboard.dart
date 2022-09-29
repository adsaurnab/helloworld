import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/widgets/appDrawer.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/';
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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

                FutureBuilder(
      future: ApiData().getApiData(),
      builder: (BuildContext context, AsyncSnapshot response) {
        if (response.data == null) {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {

                return Column(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          
                          Container(
                            width: double.infinity,
                            height: 250,
                            child: Image.network("${response.data[0]["imagePath"]}"),
                          ),
                          Container(
                            child: Text("Movie Title"),
                          ),

                          
                        ],

                        

                      ),
                    ),

                    Container(
                      child: Row(
                        children: [
                          ListView.builder(

                        shrinkWrap: false,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: response.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10,
                            height: 10,
                             
                            child: Container(
                              height: 10,
                              width: 10,
                              
                              color: Colors.black),
                          );



                        })
                          
                        ],
                      ),
                    )
                  ],
                );



        }})
                
              ],
            ),



          ),
        ),
        )
    );
    
  }
}

