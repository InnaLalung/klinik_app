import 'package:flutter/material.dart';
import 'package:klinik_app/service/login_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  _LoginState createState()=> _LoginState();
 
 }
   class _LoginState extends State<Login> {
    final _formKey = GlobalKey<FormState>();
    final _usernameCtrl = TextEditingController();
    final _passwordCtrl = TextEditingController();
   
    @override
    Widget build(BuildContext){
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Login Admin",
                style:TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                SizedBox(height:50),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width /1.3,
                      child: Column(
                        children:[
                          _usernameTextField(),
                          SizedBox(height: 20),
                          _passwordTextField(),
                          SizedBox(height: 40),
                          _tombolLogin(),
                        ],
                      ),
                    )),
                )
              ],
            ),
            )),
        ),
      );
    }

    Widget _usernameTextField(){
      return TextFormField(
        decoration: InputDecoration(labelText: "username"),
        controller: _usernameCtrl,
      );
    }
    Widget _passwordTextField(){
      return TextFormField(
        decoration: InputDecoration(labelText: "password"),
        obscureText: true,
        controller: _usernameCtrl,
      );
    }
   Widget _tombolLogin() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(child: Text("Login"), onPressed: () {}));
   }
  }
  