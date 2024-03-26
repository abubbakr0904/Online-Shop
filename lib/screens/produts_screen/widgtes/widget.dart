import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/data/models/product_model.dart';
import 'package:qwerty/screens/produts_screen/widgtes/container.dart';
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
                return const Text('No products found for the user with email');
              } else {
                // Handle displaying the list of products
                List<ProductModel> list = snapshot.data as List<ProductModel>;
                return Expanded(
                  child: GridView.builder(
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisSpacing: 10,
                      mainAxisExtent: 265.h,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel foodModel = list[index];
                      return Product(productModel: list[index]);
                    },
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
