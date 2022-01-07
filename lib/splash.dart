import 'package:flutter/material.dart';
import 'package:flutter_ewallet/screens/home/auth/login.dart';
import 'package:flutter_ewallet/screens/home/home.dart';
import 'package:flutter_ewallet/widgets/widgets.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wAppLoading(context)
    );
  }

  void _checkUserSementara(bool user) async {
    await Future.delayed(Duration(seconds: 3));
    wPushReplaceTo(context, user ? Home() : Login());
  }
}
