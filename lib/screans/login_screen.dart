import 'package:flutter/material.dart';
import 'package:news_app/mixins/validation_mixin.dart';
import 'package:news_app/services/auth_service.dart';


class LoginSreen extends StatefulWidget {
  @override
  _LoginSreenState createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login"),),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _emailTextField(),
                _passwordTextField(),
                Container(margin:EdgeInsets.only(bottom: 20.0)),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter your Email:',
        hintText: 'akash@gmail.com',
      ),
      // validator: validateEmail,
      onSaved: (value){
        email = value;
      },
    );
  }

  Widget _passwordTextField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password:',
        hintText: '*******',
      ),
      // validator: validatePassword,
      onSaved: (value){
        password = value;
      },
    );
  }

  Widget _submitButton(){
    return ElevatedButton(
      child: Text('Submit'),
      onPressed:  () async {
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          Map body = {'email': email, 'password': password};
          bool res = await AuthService.login(body);
          if(res){
            Navigator.pop(context);
            Navigator.pushNamed(context, '/');
          }
        }
      },
    );
  }
}