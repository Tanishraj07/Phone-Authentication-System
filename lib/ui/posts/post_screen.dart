import 'package:demo1/ui/auth/login_screen.dart';
import 'package:demo1/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Post'),
      actions: [
        IconButton(onPressed: (){
          auth.signOut().then((value){
            Navigator.push(context,
            MaterialPageRoute(builder:(context)=>LoginScreen()));
          }).onError((error, stackTrace){
            Utils().toastMessage(error.toString());
          });
        }, icon: Icon(Icons.logout_outlined)),
        SizedBox(width: 5,)
      ],
    centerTitle: true,
    backgroundColor: Colors.indigo,
    ),
    );
  }
}
