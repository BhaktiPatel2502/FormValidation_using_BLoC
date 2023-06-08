import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation_usingbloc/SignIn/BLoc/sign_in_bloc.dart';

import '../SignIn/SignInPage.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Form Validation using BLoc",
            style: TextStyle(
            color: Colors.white,
          ),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(60,320,10,0),
          child: Column(
            children: [
              Text(
                "Welcome to my App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: const Text(
                  'Sign In with Email',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BlocProvider(
                      create: (context) => SignInBloc(),
                        child:  SignIn())),
                  );
                },
              ),
            ],
          ),
        ),

      ),
    );
  }
}
