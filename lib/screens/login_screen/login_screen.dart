import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/bottom_navigator/bottom_navigator.dart';
import 'package:qwerty/utils/images/images.dart';
import 'package:qwerty/utils/regxps/reg_xp.dart';
import '../../view_models/auth_model.dart';
import '../../view_models/login_viewmodel.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    User? user = FirebaseAuth.instance.currentUser;
    Future.microtask(() {
      if (user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const TabScreen();
        }));
      }
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Image.asset(AppImages.person, width: 218.w, fit: BoxFit.cover),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "LOGIN",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 41.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 0.2, color: Colors.black),
                ),
                child: TextFormField(
                  controller: email,
                  onChanged: context.read<LoginViewModel>().updateEmail,
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        AppConstants.emailRegExp.hasMatch(value) ||
                        value.length < 3) {
                      return "Xato Bor";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(fontSize: 13.sp),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.mail,
                          width: 20.w,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 41.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 0.2, color: Colors.black),
                ),
                child: TextFormField(
                  controller: password,
                  onChanged: context.read<LoginViewModel>().updatePassword,
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        AppConstants.passwordRegExp.hasMatch(value) ||
                        value.length < 3) {
                      return "Xato Bor";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 13.sp),
                    prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AppImages.lock,
                          width: 20.w,
                        )),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember Me",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 203.w,
                height: 50.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1317DD)
                  ),
                  onPressed: () {
                    context.read<AuthViewModel>().loginUser(
                      context,
                      email: email.text,
                      password: password.text,
                    );
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(height: 16.h,),
              Text(
                "OR",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Log in with",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(AppImages.google),
                  SvgPicture.asset(AppImages.apple),
                  SvgPicture.asset(AppImages.facebook),
                ],
              ),
              SizedBox(height: 30.h,),
              Text(
                "Don’t have an account? Register now",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
