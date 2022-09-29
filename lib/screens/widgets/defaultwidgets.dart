import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultWidgets {

  static  featuredText (text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),
    );

  }

  static  SignupText (text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 36
      ),
    );

  }

  static  headerText (text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32
      ),
    );

  }

  static  movieTitleText (text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),
    );

  }

  static  movieTimeText (text){
    return Text(text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 13,
        color: Colors.black45
      ),
    );

  }

static  movieTimeIcon (icon){
    return Icon(icon,size: 20,);

  }  
}

