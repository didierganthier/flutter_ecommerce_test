import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_test/constants.dart';
import 'package:flutter_ecommerce_test/widgets/custom_btn.dart';
import 'package:flutter_ecommerce_test/widgets/custom_input.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //Build an alert dialog to display some errors
  Future<void> _alertDialogBuilder() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Container(
            child: Text("Just some random text for now"),
          ),
          actions: [
            FlatButton(
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
                    focusNode: _passwordFocusNode,
                  ),
                  CustomBtn(
                    text: "Create Account",
                    onPressed: () {
                      setState(() {
                        _registerFormLoading = true;
                      });
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
