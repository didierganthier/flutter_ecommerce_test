import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/screens/register_page.dart';
import 'package:flutter_ecommerce_test/widgets/custom_btn.dart';
import 'package:flutter_ecommerce_test/widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Build an alert dialog to display some errors
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          title: Text("Error"),
          content: Container(
            child: Text(error),
          ),
          actions: [
            FlatButton(
              splashColor: Colors.green,
              shape: StadiumBorder(),
              color: Colors.red,
              child: Text("Close Dialog"),
              onPressed:(){
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  Future <String> loginAccount () async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch(e) {
      if(e.code == "week-password"){
        return "The password provided is too weak";
      }
      else if(e.code == "email-already-in-use"){
        return "The account already exists for that email";
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async{
    //set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    //Run the create account method
    String _loginFeedback = await loginAccount();
    if(_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);
      //set the form to regular state [not loading]
      setState(() {
        _loginFormLoading = false;
      });
    } else {
      //the string was null, user is logged in
      Navigator.pop(context);
    }
  }

  bool _loginFormLoading = false;

  String _loginEmail = "";

  String _loginPassword = "";

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
                child: Text(
                  "Welcome User,\nLogin to your account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email...",
                    onChanged:(value){
                      _loginEmail = value;
                    },
                    onSubmitted:(value){
                      _passwordFocusNode.requestFocus();
                    },
                  ),
                  CustomInput(
                    hintText: "Password...",
                    onChanged:(value){
                      _loginPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    onSubmitted:(value){
                      _submitForm();
                    },
                    isPasswordField: true,
                  ),
                  CustomBtn(
                    text: "Login",
                    onPressed: () {
                      _submitForm();
                    },
                    isLoading: _loginFormLoading,
                    outlineBtn: false,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBtn(
                  text: "Create New Account",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
