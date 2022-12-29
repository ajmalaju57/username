import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:username/Home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    var username1  = "admin";
    var pass1  = "12345";
    return
      SafeArea(
        bottom: true,
        child: Scaffold(
          backgroundColor: Color(0xFF000633),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        TextFormField(
                          style:TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Username";
                            }
                            return null;

                          },
                          controller: username,
                          decoration: InputDecoration(
                            hintText: "UserName",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style:TextStyle(color: Colors.white),
                          controller: pass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        // SizedBox(height: 200,),
                        ElevatedButton(
                            onPressed: () async {
                              final valid = _formKey.currentState!.validate();
                              if (valid == true && username.text==username1 && pass.text==pass1) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => Home()));
                                final snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("Login  Scccus"),
                                    duration: Duration(seconds: 1));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                final snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Login  Filed"),
                                    duration: Duration(seconds: 1));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text("Login"))

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

//User user = User()
//Text (user?.name??  "Empty")

// user.name==null ? user.name:"Empty"