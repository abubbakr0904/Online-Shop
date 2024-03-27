import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/data/models/product_model.dart';
import 'package:qwerty/utils/images/images.dart';
import '../../../view_models/product_view_model.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<List<ProductModel>>(
            stream: context.read<ProductsViewModel>().listenProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: const Text('No products found for the user with email'));
              } else {
                // Handle displaying the list of products
                List<ProductModel> list = snapshot.data as List<ProductModel>;
                return Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(list.length, (index) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.h , vertical: 15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color : const Color(0xFFF8F7F7)
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(list[index].imageUrl , width: 126.w, height: 100.h,fit : BoxFit.cover),
                                SizedBox(width: 20.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(list[index].productName , style: TextStyle(
                                        color : Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        fontFamily: AppImages.fontPoppins
                                    ),),
                                    Text(list[index].productDescription , style: TextStyle(
                                        color : Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        fontFamily: AppImages.fontPoppins
                                    ),
                                      maxLines: 1,
                                    ),
                                    Text("\$${list[index].price.toString()}" , style: TextStyle(
                                        color : const Color(0xFF6055D8),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        fontFamily: AppImages.fontPoppins
                                    ),
                                      maxLines: 1,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
