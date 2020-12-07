import 'package:oopswhat/services/auth.dart';
import 'package:oopswhat/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  singUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      
      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
      .then((val){
        print("$val.uid");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ):SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(

                        controller: userNameTextEditingController,
                        validator: (val){
                          return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                        },
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("userName"),
                      ),
                      TextFormField(

                        controller: emailTextEditingController,
                        validator: (val){
                          return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                          null : "Enter correct email";
                        },
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("email"),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordTextEditingController,
                        validator:  (val){
                          return val.length < 6 ? "Enter Password 6+ characters" : null;
                        },
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("password"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Text("Forgot Password?", style: simpleTextStyle()),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap : (){
                    singUp();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff007EF4),
                              const Color(0xff2A75BC)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Sign Up", style: biggerTextStyle())
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("Sign Up With Google", style: TextStyle(
                        color: Colors.black54,
                        fontSize: 17
                    ))
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account? ", style: biggerTextStyle()),
                    Text("SignIn now", style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline
                    ))
                  ],
                ),
                SizedBox(
                  height: 54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
