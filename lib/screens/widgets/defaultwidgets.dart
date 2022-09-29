import 'package:flutter/cupertino.dart';
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
  
}

