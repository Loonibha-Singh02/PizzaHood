import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_hood/User_login/textfield.dart';
import '../firebase/firebase_auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth= FirebaseAuthService();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;

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
        body:SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register here!",
                  style: GoogleFonts.montaguSlab(
                    fontSize: 40,
                    color: const Color(0xFFFCB07E),
                  ),
                ),
                Text(
                  "Please enter your details.",
                  style: GoogleFonts.montaguSlab(
                    fontSize: 17,
                    color: const Color(0xFFFCB07E),
                  ),
                ),
                const SizedBox(height: 40),
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
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          } else if (!value.contains( RegExp(r'[A-Z]'))) {
                            return 'Password must contain at least one capital letter';
                          } else if (!value.contains( RegExp(r'\d'))) {
                            return 'Password must contain at least one number';
                          } else if (!value.contains( RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                            return 'Password must contain at least one special character';
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

                      MyTextField(
                        hintText: 'Confirm Password',
                        labelColor: const  Color(0xFFFCB07E),
                        hintColor: const  Color(0xFFFCB07E),
                        labelText: 'Confirm Password',
                        obscureText: _obscureText1,
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              _obscureText1 = !_obscureText1;
                            });
                          },
                          child: Icon(
                            _obscureText1 ? Icons.visibility_off_outlined : Icons.visibility,
                            color: const  Color(0xFFFCB07E),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),

                      ElevatedButton(
                        onPressed: _signUp,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFFFCB07E),
                          minimumSize: const Size(180,50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text("Sign Up",
                          style: TextStyle(
                              color: Color(0xFFF3F8F2),
                              fontSize: 17
                          ),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(color: Color(0xFFFCB07E),
                              fontSize: 15),
                          children: [
                            TextSpan(
                              text: 'Sign In',
                              style: const TextStyle(
                                color: Color(0xFFFCB07E),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/Signin'); // Navigate to the login page
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
        )
    );
  }

  void _signUp() async{
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if(user!=null){
      print("Successful");
      Navigator.pushNamed(context, "/Home");
    }
    else{
      print("Some error happened");
    }
  }

}
