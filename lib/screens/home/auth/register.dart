import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ewallet/screens/home/auth/login.dart';
import 'package:flutter_ewallet/screens/home/auth/verif_email.dart';
import 'package:flutter_ewallet/screens/home/home.dart';
import 'package:flutter_ewallet/utils/utlis.dart';
import 'package:flutter_ewallet/widgets/widgets.dart';
import 'package:flutter_ewallet/widgets/widget.auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Register extends StatefulWidget {
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nama = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Widget _inputNama() {
    return Container(
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        controller: _nama,
        decoration: InputDecoration(
            hintText: 'Nama', helperText: 'Masukan Nama Lengkap'),
        validator: (val) => uValidator(
          value: val!,
          isRequired: true,
          minLength: 3,
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        decoration: InputDecoration(
            hintText: 'Email', helperText: 'Masukan alamat email anda'),
        validator: (val) => uValidator(
          value: val!,
          isRequired: true,
          isEmail: true,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: _password,
            decoration: InputDecoration(
              hintText: '******',
              helperText: 'Password',
            ),
            validator: (val) => uValidator(
              value: val!,
              isRequired: true,
              minLength: 3,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            controller: _passwordConf,
            decoration: InputDecoration(
              hintText: '******',
              helperText: 'Konfirmasi Password',
            ),
            validator: (val) => uValidator(
              value: val!,
              isRequired: true,
              match: _password.text,
            ),
          ),
        ),
      ],
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
          child: Text('Register'),
          onPressed: _registerSementara),
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

  Widget _textLogin() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text('Sudah Mempunyai akun?'),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () => wPushReplaceTo(context, Login()),
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
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(width: 20),
                        wAuthTitle(
                            title: 'Register', subtitle: 'Formulir Register'),
                        _inputNama(),
                        _inputEmail(),
                        _inputPassword(),
                        SizedBox(height: 30),
                        _inputSubmit(),
                        wTextDivider(),
                        _googleSignIn(),
                        _textLogin(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void _registerSementara() async {
    if (!_formKey.currentState!.validate()) return;
    print('Nama Lengkap :${_nama.text}');
    print('Email anda :${_email.text}');
    print('Password :${_password.text}');
    print('Konfimasi Password :${_passwordConf.text}');

    setState(() => _isLoading = true);
    await Future.delayed(Duration(seconds: 3));
    wPushReplaceTo(context, Login());

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (SafeArea) {
          return VerifEmail();
        });
  }
}
