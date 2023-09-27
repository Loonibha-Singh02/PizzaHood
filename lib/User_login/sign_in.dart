import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/User_login/textfield.dart';

import '../firebase/firebase_auth_service.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignInPage> {
  final FirebaseAuthService _auth= FirebaseAuthService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FocusScope(
        child: GestureDetector(
        onTap: () {
      // Handle tap outside of text input fields
      FocusManager.instance.primaryFocus?.unfocus();
    },

      child: Scaffold(
        backgroundColor: const Color(0xFFFFEEE1),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFEEE1),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black45),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:50),
                          child: Text(
                            "Welcome Back!",
                            style: GoogleFonts.montaguSlab(
                              fontSize: 30,
                              color: const Color(0xFFFCB07E),
                            ),
                          ),
                        ),
                        Text(
                          "Please enter your details.",
                          style: GoogleFonts.montaguSlab(
                            fontSize: 15,
                            color: const Color(0xFFFCB07E),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formKey,
                          child: Column(
                            children: [
                              MyTextField(
                                hintText: 'Email',
                                labelColor: const  Color(0xFFFCB07E),
                                hintColor: const  Color(0xFFFCB07E),
                                labelText: 'Email',
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  // Add more email validation logic here if needed
                                  return null;
                                },
                                suffixIcon: const Icon(Icons.email,
                                  color: Color(0xFFFCB07E),),
                                obscureText: false,
                              ),
                              const SizedBox(height: 20),

                              MyTextField(
                                obscureText: _obscureText,
                                hintText: 'Password',
                                labelColor: const  Color(0xFFFCB07E),
                                hintColor: const  Color(0xFFFCB07E),
                                labelText: 'Password',
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText ? Icons.visibility_off_outlined : Icons.visibility,
                                    color: const  Color(0xFFFCB07E),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              const SizedBox(height: 40),

                              ElevatedButton(
                                onPressed: _signIn,
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFFFCB07E),
                                  minimumSize: const Size(150,40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Text("Sign in",
                                  style: TextStyle(
                                      color: Color(0xFFF3F8F2),
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              RichText(
                                text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: const TextStyle(color: Color(0xFFFCB07E),
                                      fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: const TextStyle(
                                        color: Color(0xFFFCB07E),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(context, '/Signup'); // Navigate to the login page
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
        )
    );
  }

  void _signIn() async{
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user!=null){
      print("Successful");
      Navigator.pushNamed(context, "/Home");
    }
    else{
      print("Some error happened");
    }
  }


}
