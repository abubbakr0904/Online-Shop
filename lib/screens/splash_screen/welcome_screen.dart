import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwerty/main.dart';
import 'package:qwerty/screens/login_screen/login_screen.dart';
import 'package:qwerty/screens/register_screen/register_screen.dart';
import 'package:qwerty/utils/images/images.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body : Container(
        padding: EdgeInsets.all(30.w),
        width: phoneWidth,
        height: phoneHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome 😇" , style: TextStyle(
                color: const Color(0xFF6055D8),
                fontWeight: FontWeight.w500,
                fontSize: 45.sp,
                fontFamily: AppImages.fontPoppins
            ),),
            SizedBox(height: 20.h,),
            Text("Sizni Online Shop do'konimizda ko'rib turganimizdan hursandmiz !" , style: TextStyle(
                color: const Color(0xFF6055D8),
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                fontFamily: AppImages.fontPoppins
            ),
            textAlign: TextAlign.center,
            maxLines: 4,
            ),
            SizedBox(height: 40.h,),
            SizedBox(
              width: 500.w,
              height: 50.h,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1317DD)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
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
            SizedBox(height: 20.h,),
            SizedBox(
              width: 500.w,
              height: 50.h,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF1317DD)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Register()));
                },
                child: Text(
                  "REGISTER",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
