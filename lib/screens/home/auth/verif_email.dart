import 'package:flutter/material.dart';

class VerifEmail extends StatefulWidget {
  @override
  _VerifEmailState createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _ResendEmailButton() {
    return Column(
      children: <Widget>[
        Text('Tidak menerima di email ?'),
        FlatButton(
          child: Text(_isLoading ? 'Sending' : 'Resend'),
          onPressed: () async {
            setState(() => _isLoading = true);

            await Future.delayed(
              Duration(seconds: 3),
            );

            setState(() {
              _isLoading = false;
              _isSended = true;
            });
          },
        )
      ],
    );
  }

  Widget _ResendEmailMsg() {
    return Container(
      child: Text(
        'Email Sended!',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget _ButtomWidget() {
    return _isSended ? _ResendEmailMsg() : _ResendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          child: Icon(Icons.drag_handle),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.alternate_email,
                size: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Verfikasi email kamu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Kami sudah mengirim link\n konfigurasi ke email anda.',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 40,
                indent: 50,
                endIndent: 50,
              ),
              Text(
                'Tolong klik dibawah ini untuk verifikasi email\n anda dan melanjutkan proses registrasi',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Divider(
                height: 40,
                indent: 50,
                endIndent: 50,
              ),
              _ButtomWidget()
            ],
          ),
        )
      ]),
    );
  }
}
