import 'package:flutter/material.dart';
import 'package:testing_flutter/main_page.dart';
import 'package:testing_flutter/utils/simple_snack_bar.dart';

import '../constants/size.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailConstroller = TextEditingController();
  TextEditingController _pwConstroller = TextEditingController();

  @override
  void dispose() {
    _emailConstroller.dispose();
    _pwConstroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 6,
              ),
              Image.asset('assets/insta_text_logo.png'),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _emailConstroller,
                decoration: getTextFieldDecor('Email'),
                validator: (String value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter your email address!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 1,
              ),
              TextFormField(
                controller: _pwConstroller,
                decoration: getTextFieldDecor('Password'),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Please enter any password!';
                  }
                  return null;
                },
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                'Forgotten password?',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final route = MaterialPageRoute(builder: (context) => MainPage());
                    Navigator.pushReplacement(context, route);
                  }
                },
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                disabledColor: Colors.blue[100],
              ),
              Spacer(
                flex: 2,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    left: 0,
                    right: 0,
                    height: 1,
                    child: Container(
                      color: Colors.grey[300],
                      height: 1,
                    ),
                  ),
                  Container(
                    color: Colors.grey[50],
                    height: 3,
                    width: 50,
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton.icon(
                textColor: Colors.blue,
                onPressed: () {
                  simpleSnackbar(context, 'facebook pressed');
                },
                icon: ImageIcon(
                  AssetImage('assets/icon/facebook.png'),
                ),
                label: Text('Login with Facebook'),
              ),
              Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }



  InputDecoration getTextFieldDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.grey[100],
      filled: true,
    );
  }
}
