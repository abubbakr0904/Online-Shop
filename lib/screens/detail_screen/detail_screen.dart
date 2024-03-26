import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwerty/utils/images/images.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.image, required this.price});

  final String image;
  final String price;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(widget.image , width: double.infinity,fit : BoxFit.cover),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40.h , horizontal: 20.w),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        // oqilov03@
                      },
                      child: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.r),
                          color : const Color(0xFFF8F7F7)
                        ),
                        child : const Icon(
                          Icons.arrow_back,
                          color : Colors.black
                        )
                      ),
                    ),
                    Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.r),
                        color : const Color(0xFFF8F7F7)
                      ),
                      child : const Icon(
                        Icons.favorite,
                        color : Colors.black
                      )
                    ),
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 16.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nike Shoes" , style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppImages.fontPoppins
                    ),),
                    Text(widget.price , style: TextStyle(
                        color: const Color(0xFF6055D8),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins
                    ),),
                  ],
                ),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color : Colors.amber,
                    ),
                    Text("   4.5 (20 Review)" , style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppImages.fontPoppins
                    ),),
                  ],
                ),
                Text("Description" , style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppImages.fontPoppins
                ),),
                Text("Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi." , style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppImages.fontPoppins
                ),
                  maxLines: 5,
                ),
                SizedBox(height: 16.h,),
                Text("Size" , style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppImages.fontPoppins
                ),),
                Row(
                  children: [
                    getCard("8"),
                    getCard("10"),
                    getCard("38"),
                    getCard("40"),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      height: 50.h,
                      child : TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF6055D8)
                        ),
                        onPressed: (){},
                        child : Text("Buy now" , style : TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppImages.fontPoppins
                        ),)
                      )
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 50.h,
                      child : TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFF8F7F7)
                        ),
                        onPressed: (){},
                        child : Icon(
                          Icons.shopping_bag_rounded,
                          color : Colors.grey,

                        )
                      )
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getCard(String number){
  return Container(
    margin: EdgeInsets.only(right: 8.w),
    width: 44.w,
    height: 44.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color : Colors.white,
        border: Border.all(
            width: 1,
            color : Colors.black
        )
    ),
    child : Center(
      child: Text(number , style: TextStyle(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: AppImages.fontPoppins
      ),),
    ),
  );
}
