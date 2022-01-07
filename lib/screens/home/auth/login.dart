import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ewallet/screens/home/auth/forgot_password.dart';
import 'package:flutter_ewallet/screens/home/auth/register.dart';
import 'package:flutter_ewallet/screens/home/home.dart';
import 'package:flutter_ewallet/utils/utlis.dart';
import 'package:flutter_ewallet/widgets/widgets.dart';
import 'package:flutter_ewallet/widgets/widget.auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
        ),
        validator: (val)=> uValidator(value: val!,
        isRequired: true,
        isEmail: true,
        ),),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: <Widget>[
        Container(
          child: TextFormField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
        validator: (val)=> uValidator(value: val!,
        isRequired: true,
        minLength: 3,
        ),),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Text('Forgot Password ?')),
        ),
        onTap: () => wPushTo(context, ForgotPassword()));
  }

  ///Submit Button
  Widget _inputSubmit() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          shape: StadiumBorder(),
          child: Text('Login'),
          onPressed: _loginSementara),
    );
  }

  ///Sign in With google
  Widget _googleSignIn() {
    return Container(
      width: double.infinity,
      child: RaisedButton.icon(
        shape: StadiumBorder(),
        icon: Icon(
          MdiIcons.google,
          size: 20,
        ),
        label: Text('Google'),
        onPressed: () {},
      ),
    );
  }

  Widget _textRegister() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text('Belum Mempunyai akun?'),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () => wPushReplaceTo(context, Register()),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      wAuthTitle(
                          title: 'Login',
                          subtitle: 'Enter Your Email & Password'),
                      _inputEmail(),
                      _inputPassword(),
                      _forgotPassword(),
                      _textRegister(),
                      _inputSubmit(),
                      wTextDivider(),
                      _googleSignIn(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _loginSementara() async {
    if (!_formKey.currentState!.validate()) return;

    if (_email.text == 'Demo@gmail.com' && _password.text == '123') {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));
      wPushReplaceTo(context, Home());
    } else {
      print('Gagal');
    }
  }
}
