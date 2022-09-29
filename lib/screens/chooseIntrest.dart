import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:helloworld/model/ApiData.dart';
import 'package:helloworld/screens/dashboard.dart';
import 'package:helloworld/screens/widgets/defaultButton.dart';
import 'package:helloworld/screens/widgets/defaultFormButton.dart';
import 'package:helloworld/screens/widgets/defaultwidgets.dart';
import 'package:helloworld/utils/utils.dart';

class ChooseIntrest extends StatefulWidget {
  static const routeName = '/chooseintrest';
  const ChooseIntrest({Key? key}) : super(key: key);

  @override
  State<ChooseIntrest> createState() => _ChooseIntrestState();
}

class _ChooseIntrestState extends State<ChooseIntrest> {
  var apidata;
  List ticked = [];
  bool loading = true;
  final GlobalKey<FormState> _formKey = GlobalKey();

  getdata() async{
   apidata = await  ApiData().getApiData();

   for (var i=0; i<apidata.length; i++){
      setState(() {
        
      ticked.add(0);
      });

      // ticked[i]=0;

    }
    if(apidata != null || apidata.isEmpty){
      setState(() {
        loading = false;
      });
      
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

    

    
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
          vertical: 10),
                  child: DefaultWidgets.headerText("Choose Your Intrests"),
                ),

                Utils.sizedboxheight10(),
                Utils.sizedboxheight10(),
                
                
      
                FutureBuilder(
                  future: ApiData().getApiData(),
                  builder: (BuildContext context, AsyncSnapshot response) {
                    if (response.data == null) {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {

                      
                      
      
                      return GridView.builder(
                                    // shrinkWrap: true,
                                    // physics: ClampingScrollPhysics(),
                                    // itemCount: response.data.length,
                                    // itemBuilder: (BuildContext context, int index) {

                                      shrinkWrap: true,
                                      primary: false,
                                      // padding:  EdgeInsets.symmetric(vertical:20),

                                      

                

                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 270/300
                                ),
                                itemCount: response.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  
                                  
                                return  Stack(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        if(ticked[index] == 0){
                                          setState(() {
                                            ticked[index] = 1;
                                            print(ticked);
                                            print(ticked[index]);
                                          });
                                          
                                        }
                                        else{
                                          setState(() {
                                            ticked[index] = 0;
                                          });
                                          
                                        }

                                      },
                                      child: Container(
                                        // height: 250,
                                        // margin: EdgeInsets.symmetric(vertical:10),
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 50,
                                    
                                                    backgroundImage: NetworkImage("${response.data[index]["imagePath"]}"),
                                                    backgroundColor: Colors.transparent,
                                                    
                                                    // child: Image.network("${response.data[index]["imagePath"]}"),
                                                  ),
                                                  Utils.sizedboxheight10(),
                                                  Container(
                                                    child: Text("${response.data[index]["title"]}"),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),

                                    (ticked[index] == 1)?Positioned(
                                      right: 20,

                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 18, 33, 46),
                                          borderRadius: BorderRadius.circular(30)
                                        ),
                                      child: Icon(FontAwesomeIcons.check, color:Colors.white),

                                    )):Container()
                                  
                                  
                                  ],
                                );
                                      
                                    });
                    }
                  }
                ),
                Utils.sizedboxheight10(),
                Utils.sizedboxheight10(),
                Utils.sizedboxheight10(),

                buttondefault( text: "Next")
      
              ],
            )
          ),
        ),
      ),
      );

    
  }
}