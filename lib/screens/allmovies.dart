import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';

class AllMovies extends StatefulWidget {
  const AllMovies({Key? key}) : super(key: key);

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("All Movies"),
        ),
        body: Container(
          child: Stack(
            children: [
             
                    VerticalDivider(
                            color: Colors.black,
                            width: 10,
                            thickness: 1.2,
                            // width: MediaQuery.of(context).size.height*.8,
                            // height: MediaQuery.of(context).size.height*.8,
                          ),

                          // Container(
                          //   child: FutureBuilder(
                          //     future: ApiData().getApiData(),
                          //     builder: (BuildContext context, AsyncSnapshot response) {
                          //       if (response.data == null) {
                          //         return Container(
                          //           child: Center(child: CircularProgressIndicator()),
                          //         );
                          //       } else {
                          //         return ListView(children: [
                          //           Container(
                          //               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          //               child: ListView.builder(
                          //                   shrinkWrap: true,
                          //                   physics: ClampingScrollPhysics(),
                          //                   itemCount: response.data.length,
                          //                   itemBuilder: (BuildContext context, int index) {
                          //                     return Container(

                          //                     );
                                              
                                              
                          //                   }
                          //               )
                          //           )
                          //         ]
                                    
                          //           );
                          //       }
                          //     }
                          //   )
                          // )
                  

            ]
          ),
        ),
        
      ),
    );
    
  }
}