import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../data/models/product_model.dart';
import '../../utils/images/images.dart';
import '../../view_models/product_view_model.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(
          Icons.add,
          color : Colors.transparent
        ),
        title: Text("Message"),
      ),
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
                return Center(
                    child: const Text(
                        'No products found for the user with email'));
              } else {
                // Handle displaying the list of products
                products = snapshot.data as List<ProductModel>;
                return Expanded(
                  child: ListView(
                    children: [
                      ...List.generate(
                          products.length,
                          (index) => Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15.h, vertical: 15.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.r),
                                      topRight: Radius.circular(20.r),
                                      bottomLeft: Radius.circular(20.r),
                                    ),
                                    color: const Color(0xFFF8F7F7)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          child: Image.network(
                                              products[index].imageUrl,
                                              width: 60.w,
                                              height: 60.h,
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(60.r),
                                        ),
                                        Text(
                                          "    New message",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: AppImages.fontPoppins,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60.r),
                                        color : Colors.black.withOpacity(0.3)
                                      ),
                                      child: Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: AppImages.fontPoppins,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
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
