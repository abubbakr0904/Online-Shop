import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwerty/screens/home_screen/home_screen.dart';
import 'package:qwerty/screens/splash_screen/welcome_screen.dart';
import 'package:qwerty/utils/images/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (!mounted) return;

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  void initState() {
    _init();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_basket_rounded,
              color : const Color(0xFF6055D8),
              size: 100.sp,
            ),
            Text("Online Shop" , style: TextStyle(
              color: const Color(0xFF6055D8),
              fontWeight: FontWeight.w500,
              fontSize: 50.sp,
              fontFamily: AppImages.fontPoppins
            ),)
          ],
        ),
      )
    );
  }
}
