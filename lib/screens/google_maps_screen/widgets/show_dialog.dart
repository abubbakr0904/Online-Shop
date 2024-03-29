import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/services/local_database.dart';
import 'package:qwerty/utils/images/images.dart';
import 'package:qwerty/view_models/map_view_model.dart';

textFieldDialog({
  required BuildContext context,
  required LatLng ltln
}) {
  final TextEditingController body = TextEditingController();
  String category = "";
  String categoryIcon = "";
  int c = 0;
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Container(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Yangi manzil ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins)),
                SizedBox(height: 20.h,),
                SizedBox(
                    height: 80.h,
                    child: TextField(
                      controller: body,
                      decoration: InputDecoration(
                          hintText: "Manzil",
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10.r))),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          c = 1;
                          category = "Home";
                          categoryIcon = AppImages.homeL;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                              color : c == 1 ? Colors.grey : Colors.transparent
                          ),
                          child: Image.asset(AppImages.homeL,
                              width: 70.w, fit: BoxFit.cover),
                        )),
                    GestureDetector(
                        onTap: () {
                          c = 2;
                          category = "Location";
                          categoryIcon = AppImages.location;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.w),
                              color : c == 2 ? Colors.grey : Colors.transparent
                          ),
                          child: Image.asset(AppImages.location,
                              width: 70.w, fit: BoxFit.cover),
                        )),
                    GestureDetector(
                        onTap: () {
                          c = 3;
                          category = "Work";
                          categoryIcon = AppImages.work;
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.w),
                            color : c == 3 ? Colors.grey : Colors.transparent
                          ),
                          child: Image.asset(AppImages.work,
                              width: 70.w, fit: BoxFit.cover),
                        )),
                  ],
                ),
                SizedBox(height: 20.h,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.5)
                  ),
                    onPressed: () {
                      context.read<MapsViewModel>().addNewMarker(
                          title: category, body: body.text, icon: categoryIcon , latlng: ltln);
                      LocalNotificationService.localNotificationService
                          .showNotification(
                              title: "Manzil qoshildi", body: body.text, id: 0);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Manzil Qo'shish",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppImages.fontPoppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp),
                    ))
              ],
            ));
      });
    },
  );
}

void _showToast(BuildContext context, String txt, Color clr) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(Fluttertoast.showToast(
      msg: txt,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: clr,
      textColor: Colors.white,
      fontSize: 16.0) as SnackBar);
}
