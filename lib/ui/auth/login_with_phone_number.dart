import 'package:demo1/ui/auth/verify_code.dart';
import 'package:demo1/utils/utils.dart';
import 'package:demo1/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  bool loading=false;
  final phoneNumberController=TextEditingController();
  final auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
             SizedBox(height: 80,),

            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: '+1 234 3455 234',
              ),
            ),
            SizedBox(height: 80,),
            RoundButton(title:'Login', onTap:(){

              auth.verifyPhoneNumber(
                 phoneNumber: phoneNumberController.text,
                  verificationCompleted:(_){

                  },
                  verificationFailed: (e){
                   Utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationId,int? token){
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context)=> VerifyCodeScreen(verificationId:verificationId ,)));
                  },
                  codeAutoRetrievalTimeout: (e){
                   Utils().toastMessage(e.toString());
                  });
            })
          ],
        ),
      ),
    );
  }
}