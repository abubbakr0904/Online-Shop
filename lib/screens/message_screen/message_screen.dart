import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../data/models/product_model.dart';
import '../../utils/images/images.dart';
import '../../view_models/location_view_model.dart';
import '../../view_models/map_view_model.dart';
import '../../view_models/product_view_model.dart';
import '../google_maps_screen/google_maps_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<ProductModel> products = [];
  @override
  void initState() {
    LatLng? latLng = context.read<LocationViewModel>().latLng;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(
          Icons.add,
          color : Colors.transparent
        ),
        title: Text("Message"),
        actions: [
          IconButton(onPressed: (){
            LatLng? latLng = context.read<LocationViewModel>().latLng;
            if (latLng != null) {
              Provider.of<MapsViewModel>(context, listen: false)
                  .setLatInitialLong(latLng);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return GoogleMapsScreen();
                  },
                ),
              );
            }
            else{
              debugPrint("Null kelidi ");
            }
          }, icon: Icon(
            Icons.location_history_rounded,
            color : Colors.black,

          ))
        ],
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
                                    horizontal: 15.h, vertical: 5.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.h, vertical: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.r),
                                      topRight: Radius.circular(40.r),
                                      bottomRight: Radius.circular(40.r),
                                    ),
                                    color: Colors.black.withOpacity(0.05)),
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
                                              height: 60.w,
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
