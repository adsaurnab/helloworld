import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/model/ApiData.dart';

class getandsortapidata extends StatelessWidget {
  final mywidget;
  const getandsortapidata({
    this.mywidget,
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
  var  response;
   mycarousel({
    @required this.response,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    // Padding(
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 10,
    //     horizontal: 30

    //   ),
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

