import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/widgets/custom_btn.dart';
import 'package:flutter_ecommerce_test/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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

  //Create a new user account
  Future <String> createAccount () async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _registerEmail, password: _registerPassword);
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
      _registerFormLoading = true;
    });

    //Run the create account method
    String _createAccountFeedback = await createAccount();
    if(_createAccountFeedback != null) {
      _alertDialogBuilder(_createAccountFeedback);
      //set the form to regular state [not loading]
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      //the string was null, user is logged in
      Navigator.pop(context);
    }
  }

  //Default form loading state
  bool _registerFormLoading = false;

  //Form Input Field Values
  String _registerEmail = "";
  String _registerPassword = "";

  //Focus Node for input fields
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
                  "Create A New Account",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email...",
                    onChanged: (value){
                      setState(() {
                        _registerEmail = value;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    onSubmitted:(value){
                      _passwordFocusNode.requestFocus();
                    },
                  ),
                  CustomInput(
                    isPasswordField: true,
                    hintText: "Password...",
                    onChanged:(value){
                      setState(() {
                        _registerPassword = value;
                      });
                    },
                    onSubmitted:(value){
                      _submitForm();
                    },
                    focusNode: _passwordFocusNode,
                  ),
                  CustomBtn(
                    text: "Create Account",
                    onPressed: () {
                      _submitForm();
                    },
                    isLoading: _registerFormLoading,
                    outlineBtn: false,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBtn(
                  text: "Back To Login",
                  onPressed: () {
                    Navigator.pop(context);
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
