import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:evently/firebase/firebase_manager.dart';
import 'package:evently/screens/home/home_screen.dart';
import 'package:evently/screens/register/signup_screen.dart';

import '../../providers/app_provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";

  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/logo_v.png", height: 136.h, width: 136.w),
              TextFormField(
                controller: emailController,

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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
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
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: Color(0xFF5669FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseManager.login(
                    emailController.text,
                    passwordController.text,
                    () {
                      appProvider.initUser();
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
                },
                child: Text(
                  "Login",

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
                      text: "Don't have an account? ",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignupScreen.routeName);
                        },
                      text: "Create Account",
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
    );
  }
}
