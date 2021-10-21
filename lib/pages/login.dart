import 'package:flutter/material.dart';
import 'package:new_app/utils/routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "images/undraw_hey_email_liaa.png",
                fit: BoxFit.cover,
                height: 400.0,
                width: 500,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Username Cannot Be Empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Password Cant Be Empty ";
                        } else if (value!.length < 6) {
                          return "Password shoud at least 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 40.0),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changeButton ? 50 : 150,
                        alignment: Alignment.center,
                        //color: Colors.deepPurple,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            //shape: changeButton
                            // ? BoxShape.circle
                            // : BoxShape.rectangle,
                            // )
                            borderRadius:
                                BorderRadius.circular(changeButton ? 20 : 8)),
                        //ElevatedButton(
                        //child: Text("Login"),
                        // style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                        // onPressed: () {
                        //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                        // }),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
