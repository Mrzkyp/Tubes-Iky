import 'package:flutter/material.dart';
import 'package:flutter_ewallet/utils/utlis.dart';
import 'package:flutter_ewallet/widgets/widget.auth.dart';
import 'package:flutter_ewallet/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          helperText: 'Enter your Email',
        ),
        validator: (val) => uValidator(value: val!,
        isRequired: true,
        isEmail: true,
        ),
      ),
    );
  }

  ///Submit Button
  Widget _inputSubmit() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          shape: StadiumBorder(),
          child: Text('Send'),
          onPressed: _ForgotPassword),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key:_formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      wAuthTitle(
                        title: 'Forgot Password',
                        subtitle:
                            'Enter Your Email and we\'ll send you a link \nto reset your password',
                      ),
                      _inputEmail(),
                      SizedBox(
                        height: 30,
                      ),
                      _inputSubmit(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _ForgotPassword() async {

    if (!_formKey.currentState!.validate()) return;

    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      print('Berhasil');
      await Future.delayed(
        Duration(seconds: 2),
      );
      wShowToast(
          'Email Terkirim! Silahkan periksa Email anda untuk mereset Password.');
      Navigator.pop(context);
    } else {
      print('Gagal');
    }
  }
}
