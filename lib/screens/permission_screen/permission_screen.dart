import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwerty/utils/images/images.dart';
import 'package:qwerty/utils/permission/permission.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permissions"),
      ),
      body : SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                AppPermissions.getCameraPermission();
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color : Colors.black.withOpacity(0.5),
                ),
                child : Center(
                  child : Text(
                    "Camera",
                    style: TextStyle(
                      color : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      fontFamily: AppImages.fontPoppins
                    ),
                  )
                )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getBluetoothPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Bluetooth",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getAudioPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Audio",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getBackgroundRefreshPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Background",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getPhonePermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Phone",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getContactsPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Contact",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getSmsPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Sms",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getSmsPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Sms",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getScanPermission();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "ScanBluetooth",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),
            GestureDetector(
              onTap: (){
                AppPermissions.getSomePermissions();
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w , vertical: 10.h),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color : Colors.black.withOpacity(0.5),
                  ),
                  child : Center(
                      child : Text(
                        "Some",
                        style: TextStyle(
                            color : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            fontFamily: AppImages.fontPoppins
                        ),
                      )
                  )
              ),
            ),

          ],
        ),
      )
    );
  }
}
