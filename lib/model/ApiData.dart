import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ApiData{

  Future<dynamic> getApiData()async{

    final url = "https://www.jsonkeeper.com/b/2W1I";
    var data = await http.get(
      Uri.parse(url),
      
    );

    var resBody = json.decode(data.body);
    print(resBody);
    print(resBody["data"]);
    // print(data.body[0]);
    return resBody["data"];
    

  }

  

}