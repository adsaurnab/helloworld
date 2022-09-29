import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Signup extends StatefulWidget {
  static const routeName = '/';
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  
  TextEditingController _email = TextEditingController();

   List<String> gender = <String>['Male', 'Female', 'Other'];
   String? dropdownValue;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
     dropdownValue = gender.first;
  }
   

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(

            child: Column(
              children: [
                Text("Signup"),

                Container(
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      // labelText: "Email",
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) {
                    //   if (value!.isEmpty || !value.contains('@')) {
                    //     return "Invalid Email";
                    //   }
                    //   return null;
      
                    // },
                    onSaved: (value) {
                      // _authData['email'] = value!;
                    },
                  ),
                ),

                Container(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: gender.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )


              ],

            ),
          ))),
    );
  }
}