import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Builder(
        builder: (childContext) => Center(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("username:"),
                  TextFormField(
                    validator: (value){
                      if(value.isEmpty){
                        return "Please enter username...";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter username here...",
                        contentPadding: EdgeInsets.only(top: 16)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text("password:"),
                  ),
                  TextFormField(
                    validator: (value) {
                      if(value.isEmpty){
                        return "Please enter email...";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter email here...",
                        contentPadding: EdgeInsets.only(top: 16)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState.validate()){
                              Scaffold.of(childContext).showSnackBar(SnackBar(
                                  content: Text("Valid validator...")
                              ));
                            }else{
                              Scaffold.of(childContext).showSnackBar(SnackBar(
                                  content: Text("Invalid validator...")
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(elevation: 10),
                          child: Text("LOGIN"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}