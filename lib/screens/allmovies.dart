import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/model/ApiData.dart';

class AllMovies extends StatefulWidget {
  static const routeName = '/dsh';
  const AllMovies({Key? key}) : super(key: key);

  @override
  State<AllMovies> createState() => _AllMoviesState();
}

class _AllMoviesState extends State<AllMovies> {

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
          title: Text("All Movies"),
          centerTitle: true,
        ),
        body: Container(
          child: Stack(
            children: [

              SingleChildScrollView(
                child: Container(
                  child: 
                  Stepper(
                    currentStep: currentstep,
                    onStepTapped: (index){
                      setState(() {
                        currentstep = index;
                      });
              
                    },
                    controlsBuilder: (context, _) {
                      return Container(
                       
                      );
                    },
              
                    
                    
                    steps: [

                      Step(
                        // subtitle: Text("asd"),
                        title: Text("Rango"), 
                        content: Container(
                          
                        )
                      ),

                      Step(
                        // subtitle: Text("asd"),
                        title: Text("Rio"), 
                        content: Container(
                          
                        )
                      ),

                      Step(
                        // subtitle: Text("asd"),
                        title: Text("Rio 2"), 
                        content: Container(
                          
                        )
                      ),

                      Step(
                        // subtitle: Text("asd"),
                        title: Text("Rango"), 
                        subtitle: Text("Captured by smugglers when he was just a hatchling, a macaw named Blu (Lorànt Deutsch) never learned to fly but has a happy domesticated life in Minnesota with Linda (Élisabeth Ventura), who thinks he is the last of his breed."),
                        content: Container(
                          
                        )
                      ),
                  
                  // createSteps()

                  ]
                  )               

                ),
              )



             
                    

            ]
          ),
        ),
        
      ),
    );
    
  }

  createSteps(){
    return 

    FutureBuilder(
      future: ApiData().getApiData(),
      builder: (BuildContext context, AsyncSnapshot response) {
        if (response.data == null) {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {


                 

                       return Container();
                    // return  Step(
                    //     // subtitle: Text("asd"),
                    //     title: Text("${response.data[0]["title"]}"), 
                    //     content: Container(
                          
                    //     )
                    // );
              
                    
                    
        }}
    );
  }

  
}