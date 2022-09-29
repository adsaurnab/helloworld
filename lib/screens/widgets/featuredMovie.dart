
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/details.dart';

class getandsortapidatafeatured extends StatelessWidget {
  final mywidget;
  const getandsortapidatafeatured({
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
          List<Widget> data = [];

          // for (var i in response.data){

          //   data.add(featuredWidget(response: i));
          //   // return  featuredWidget(response: i);

                          
          // }
          // return data;

          return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
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


class featuredWidget extends StatelessWidget {
  var  response;
   featuredWidget({
    this.response,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Details(details: response),
                ));
      },
      child: Container(
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
      ),
    );
  }
}

