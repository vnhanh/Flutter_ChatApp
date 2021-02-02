// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat.dart';

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
          child: createFrom(childContext),
        ),
      )
    );
  }

  Widget createFrom(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value){
                if(value.isEmpty){
                  return "Please enter username...";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter username here...",
                contentPadding: EdgeInsets.only(top: 16),
                prefixIcon: IconButton(
                  icon: Icon(Icons.account_box)
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              validator: (value) {
                if(value.isEmpty){
                  return "Please enter password...";
                }else if(value.length < 5){
                  return "Password must be at least 5 characters";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Enter password here...",
                contentPadding: EdgeInsets.only(top: 16),
                prefixIcon: IconButton(
                  icon: Icon(Icons.lock),
                ),
              ),
            ),
            createSubmitButton(context)
          ],
        ),
      ),
    );
  }

  Widget createSubmitButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: (){
              if(_formKey.currentState.validate()){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ChatPage()),
                // );
                _processLogin(context);
              }else{
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Invalid validator...")
                ));
              }
            },
            style: ElevatedButton.styleFrom(elevation: 10),
            child: Text("LOGIN"),
          ),
        ),
      ),
    );
  }

  void _processLogin(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _context){
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text("Loading..."),
                ),
              ],
            ),
          ),
        );
      }
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, "/chat");
    });
  }
}