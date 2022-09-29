import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/screens/dashboard.dart';

class buttondefault extends StatelessWidget {
   buttondefault({
    this.text,
    // this.route,
    Key? key,
  }) :  super(key: key);

   var text;
  //  var route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              // side: BorderSide(color: Colors.red)
            )
          )
        ),
              
        child:  Text("$text",
          style:  TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () {
          // _submit();
          
          // if (!_formKey.currentState!.validate()) {
          //   // Invalid!
          //   return;
          // }
          // else{
          //   // route;
          //   Navigator.pushNamed(context, Dashboard.routeName);
          // }
          Navigator.pushNamed(context, Dashboard.routeName);
        },
        
      ),
    );
  }
}