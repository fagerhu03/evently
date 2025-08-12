import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/screens/home/home_screen.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "SignupScreen";

  SignupScreen({super.key});

  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  var useNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/images/logo_v.png",
                  height: 136.h,
                  width: 136.w,
                ),
                TextFormField(
                  controller: useNameController,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username is Required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                TextFormField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is Required";
                    }

                    final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value);

                    if (!emailValid) {
                      return "Email Not valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone is Required";
                    }

                    if (value.length != 11) {
                      return "Phone Not valid";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Phone",
                    prefixIcon: Icon(Icons.call),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is Required";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color:Color(0xFF5669FF),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                TextFormField(
                  controller: rePasswordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "RePassword is Required";
                    }
                    if (passwordController.text != value) {
                      return "Re Password is not match";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "RePassword",
                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Color(0xFF5669FF),),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FirebaseManager.signUp(
                        emailController.text,
                        passwordController.text,
                        phoneController.text,
                        useNameController.text,
                        () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                            (route) => false,
                          );
                        },
                        (message) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Error"),
                              content: Text(message),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Okay"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    "SignUp",

                    style: GoogleFonts.inter(color: Colors.white, fontSize: 24.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5669FF),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "I have an account! ",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                        text: "Login",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          color: Color(0xFF5669FF),
                          fontWeight: FontWeight.bold,
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
    );
  }
}
