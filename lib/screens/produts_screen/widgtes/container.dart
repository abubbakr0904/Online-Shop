import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwerty/data/models/product_model.dart';

class Product extends StatelessWidget {
  const Product({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(productModel.imageUrl),
          Text(productModel.productName , style: TextStyle(
            color : Colors.black,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
          ),)
        ],
      )
    );
  }
}
