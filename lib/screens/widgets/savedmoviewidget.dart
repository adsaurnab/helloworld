
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/details.dart';
import 'package:helloworld/utils/utils.dart';

class SavedMovie extends StatelessWidget {
  final mywidget;
  const SavedMovie({
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
         
          return GridView.builder(
                        shrinkWrap: true,
                                      primary: false,
                                  
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 200/300
                                ),
                                itemCount: response.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  SavedMovieWidget(response:  response.data[index]);
                        });
        }
      }
    );
                          

                       

    
  }
}


class SavedMovieWidget extends StatelessWidget {
  var  response;
   SavedMovieWidget({
    this.response,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => Details(details: response),
        //         ));
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Icon(Icons.star),
            //     SizedBox(width: 5,),
            //     Text("9.2")
            //   ],
            // ),
    
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: Image.network(response["imagePath"])),

              Utils.sizedboxheight10(),
    
            Container(
              // width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(response["title"]),
    
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

