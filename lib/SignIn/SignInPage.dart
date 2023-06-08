import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvalidation_usingbloc/SignIn/BLoc/sign_in_bloc.dart';
import 'package:formvalidation_usingbloc/SignIn/BLoc/sign_in_event.dart';
import 'package:formvalidation_usingbloc/SignIn/BLoc/sign_in_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 40),
              child: BlocBuilder<SignInBloc,SignInState>(
                builder: (context,state) {
                  if(state is SignInErrorState){
                    return Text(state.errorMessage,style: TextStyle(color: Colors.red),);
                  }
                  else{
                    return Container();
                  }
                }
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 30,right: 30,),
              child: TextField(
                controller: emailController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text,passwordController.text),
                  );
                },
                decoration: InputDecoration(
                  hintText: "Enter the Email",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30,right: 30,),
              child: TextField(
                controller: passwordController,
                onChanged: (val){
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(emailController.text,passwordController.text),
                  );
                },
                decoration: InputDecoration(
                  hintText: "Enter the Password",
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<SignInBloc,SignInState>(
              builder: (context,state){
                if(state is SignInLoadingState){
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if(state is SignInValidState){
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmittedEvent(emailController.text,passwordController.text),
                      );
                    }
                  },
                  color: (state is SignInValidState)? Colors.indigo : Colors.grey,
                  child: Text("Sign In"),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
