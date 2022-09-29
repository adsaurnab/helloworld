import 'package:flutter/material.dart';
import 'package:helloworld/screens/allmovies.dart';
import 'package:helloworld/screens/chooseIntrest.dart';
import 'package:helloworld/screens/dashboard.dart';
import 'package:helloworld/screens/details.dart';
import 'package:helloworld/screens/savedmovies.dart';
import 'package:helloworld/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      // home:  Dashboard(),
      
      // MyHomePage(title: "hello",)
      initialRoute: 
      // SavedMovies.routeName,
      // Dashboard.routeName,
      "/",
      routes: {
        Dashboard.routeName: (cxt) => Dashboard(),

        AllMovies.routeName: (ctx) => AllMovies(),
        Details.routeName: (ctx) => Details(),
        Signup.routeName: (ctx) => Signup(),
        ChooseIntrest.routeName: (ctx) => ChooseIntrest(),
        SavedMovies.routeName: (ctx) => SavedMovies(),
        
        


      },



    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
