
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/model/ApiData.dart';

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
                          return  featuredJobsWidget(response:  response.data[index]);
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
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Image.network(response["imagePath"]),
          ),
          SizedBox(width: 10,),

          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(response["title"]),
                    Icon(FontAwesomeIcons.heart)
                  ],
                ),

                Container(
                  child: Text(response["details"]),
                )
              ],
            )
          
          )

        ],
      )



      // child: Column(
      //   children: [
      //     Row(
      //       children: [
      //         Icon(Icons.star),
      //         SizedBox(width: 5,),
      //         Text("9.2")
      //       ],
      //     ),

      //     Container(
      //       height: 150,
      //       child: Image.network(response["imagePath"])),

      //     Container(
      //       // width: double.infinity,
      //       padding: EdgeInsets.symmetric(horizontal: 5),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
                
      //           Text("Year: 2004"),

      //           Icon(FontAwesomeIcons.heart),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

