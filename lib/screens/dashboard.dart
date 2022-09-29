import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
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
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  child: Column(
                    children: [
                      
                      Container(
                        child: Image.network("https://c8.alamy.com/comp/PMBTWT/the-new-animated-adventure-storks-a-warner-bros-pictures-release-poster-PMBTWT.jpg"),
                      ),
                      Container(
                        child: Text("Movie Title"),
                      )
                    ],
                  ),
                )
                
              ],
            ),
          ),
        ),
        )
    );
    
  }
}