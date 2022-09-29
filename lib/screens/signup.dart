import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:helloworld/screens/dashboard.dart';
import 'package:helloworld/screens/widgets/defaultFormButton.dart';
import 'package:helloworld/screens/widgets/defaultwidgets.dart';
import 'package:helloworld/utils/utils.dart';

class Signup extends StatefulWidget {
  static const routeName = '/signup';
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  
  TextEditingController _email = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();

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
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 20),
          
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    
                    child: DefaultWidgets.SignupText("Signup"),
                  ),
                  
                  
                  Utils.sizedboxheight10(),
                  Utils.sizedboxheight10(),
          
                  Container(
                    child: TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        // border: InputBorder.none,
                        prefixIcon: Icon(Icons.email)
                        
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return "Invalid Email";
                        }
                        return null;
                
                      },
                      onSaved: (value) {
                        // _authData['email'] = value!;
                      },
                    ),
                  ),
          
                  // ()?Container(
                  //   child: Text("Validation text"),
                  // ):Container(),

                  Utils.sizedboxheight10(),
          
                  Container(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                       decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        ),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
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
                  ),
                  
                  Utils.sizedboxheight10(),

                  Container(
                    child: TextFormField(
                      controller: _dob,
                      decoration: const InputDecoration(
                        labelText: "Date Of Birth (yyyy/dd/mm)",
                        // border: InputBorder.none,
                        prefixIcon: Icon(Icons.calendar_month)
                        
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
                  
                  Utils.sizedboxheight10(),
                  
                  Container(
                    child: TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        // border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock)
                        
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || value != _confirmpass.text) {
                          return "Invalid password";
                        }
                        return null;
                
                      },
                      onSaved: (value) {
                        // _authData['email'] = value!;
                      },
                    ),
                  ),
                  Utils.sizedboxheight10(),
              
                  Container(
                    child: TextFormField(
                      controller: _confirmpass,
                      decoration: const InputDecoration(
                        labelText: "Retype Password",
                        // border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock)
                        
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty || value != _password.text) {
                          return "Invalid password";
                        }
                        return null;
                
                      },
                      onSaved: (value) {
                        // _authData['email'] = value!;
                      },
                    ),
                  ),

                  Utils.sizedboxheight10(),
                  Utils.sizedboxheight10(),
          
                  Formbuttondefault(formKey: _formKey, text: "Signup")
                ],
          
              ),
            ),
          ))),
    );
  }
}

