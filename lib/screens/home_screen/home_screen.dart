import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/detail_screen/detail_screen.dart';
import 'package:qwerty/screens/produts_screen/product_screen.dart';
import 'package:qwerty/utils/images/images.dart';

import '../../view_models/auth_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<AuthViewModel>().getUser;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 64.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.person,
                          width: 48.w, height: 48.w, fit: BoxFit.cover),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "Hello !\n${user!.displayName.toString()}",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.jingle,
                          width: 25.w, fit: BoxFit.cover))
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 22.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: const Color(0xFFF8F7F7)),
                  child: TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.w,
                        fontFamily: AppImages.fontPoppins,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Search here",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 12.w,
                            fontFamily: AppImages.fontPoppins,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.r)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30.r))),
                  )),
              SizedBox(
                height: 22.h,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductsScreen()));
                },
                child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xFF6055D8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get Winter Discount\n20% Off\nFor Childern",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppImages.fontPoppins,
                              fontSize: 20.sp),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins,
                        fontSize: 16.sp),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: const Color(0xFF6055D8),
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      6,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailScreen(image: AppImages.oyoqKiyim, price: "\$430")));
                        },
                        child : Container(
                          margin: EdgeInsets.only(
                            right: 16.w
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color : const Color(0xFFF8F7F7)
                          ),
                          width: 126.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(AppImages.oyoqKiyim , width: double.infinity, fit : BoxFit.cover),
                              SizedBox(height: 5.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 5.h),
                                child : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nike Shoes",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: AppImages.fontPoppins,
                                          fontSize: 14.sp),
                                    ),
                                    Text(
                                      "\$430",
                                      style: TextStyle(
                                          color: const Color(0xFF6055D8),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: AppImages.fontPoppins,
                                          fontSize: 14.sp),
                                    ),
                                  ],
                                )
                              )
                            ],
                          ),
                        )
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Most Popular",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins,
                        fontSize: 16.sp),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: const Color(0xFF6055D8),
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      6,
                          (index) => GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailScreen(image: AppImages.oyoqKiyim, price: "\$430")));
                          },
                          child : Container(
                            margin: EdgeInsets.only(
                                right: 16.w
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color : const Color(0xFFF8F7F7)
                            ),
                            width: 126.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(AppImages.oyoqKiyim , width: double.infinity, fit : BoxFit.cover),
                                SizedBox(height: 5.h,),
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 5.h),
                                    child : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nike Shoes",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: AppImages.fontPoppins,
                                              fontSize: 14.sp),
                                        ),
                                        Text(
                                          "\$430",
                                          style: TextStyle(
                                              color: const Color(0xFF6055D8),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: AppImages.fontPoppins,
                                              fontSize: 14.sp),
                                        ),
                                      ],
                                    )
                                )
                              ],
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
