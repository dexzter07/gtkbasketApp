import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtkbasket/services/authservice.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verficationId, smsCode;

  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Enter phone number"),
                onChanged: (value) {
                  setState(() {
                    this.phoneNo = "+91" + value;
                  });
                },
              ),
            ),
            codeSent
                ? Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Enter OTP'),
                      onChanged: (value) {
                        setState(() {
                          this.smsCode = value;
                        });
                      },
                    ),
                  )
                : Container(),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: RaisedButton(
                child: codeSent ? Text('Verify') : Text('Send'),
                onPressed: () {
                  codeSent
                      ? AuthService().signInWithOTP(smsCode, verficationId)
                      : verifyPhone(phoneNo);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print('${authException.message}');
    };
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verficationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verficationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
