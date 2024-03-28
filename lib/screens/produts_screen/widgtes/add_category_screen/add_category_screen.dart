import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/data/models/product_model.dart';
import 'package:qwerty/utils/images/images.dart';
import 'package:qwerty/utils/regxps/reg_xp.dart';
import 'package:qwerty/view_models/product_view_model.dart';

import '../../../../services/local_database.dart';
import '../../../../view_models/image_view_model.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  int id = 1;
  String fcmToken = "";

  void init() async {
    fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    debugPrint("FCM TOKEN:$fcmToken");
    final token = await FirebaseMessaging.instance.getAPNSToken();
    debugPrint("getAPNSToken : ${token.toString()}");
    LocalNotificationService.localNotificationService;
    //Foreground
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage remoteMessage) {
        if (remoteMessage.notification != null) {
          LocalNotificationService().showNotification(
            title: remoteMessage.notification!.title!,
            body: remoteMessage.notification!.body!,
            id: DateTime.now().second.toInt(),
          );

          debugPrint(
              "FOREGROUND NOTIFICATION:${remoteMessage.notification!.title}");
        }
      },
    );
    //Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      debugPrint("ON MESSAGE OPENED APP:${remoteMessage.notification!.title}");
    });
    // Terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        debugPrint("TERMINATED:${message.notification?.title}");
      }
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  final ImagePicker picker = ImagePicker();

  String imageUrl = "";
  String storagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            "New Product",
            style: TextStyle(
                color: Colors.black,
                fontFamily: AppImages.fontPoppins,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.h),
            height: 61.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(width: 0.2, color: Colors.black),
            ),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(fontSize: 17.sp),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.h),
            height: 61.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(width: 0.2, color: Colors.black),
            ),
            child: TextFormField(
              controller: price,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Price",
                hintStyle: TextStyle(fontSize: 17.sp),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.h),
            height: 61.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(width: 0.2, color: Colors.black),
            ),
            child: TextFormField(
              controller: description,
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(fontSize: 17.sp),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.red),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              takeAnImage();
            },
            child: Column(
              children: [
                Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 15.w, horizontal: 20.h),
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Center(
                      child: Column(
                        children: [
                          if (context.watch<ImageViewModel>().getLoader)
                            const CircularProgressIndicator(),
                          if (imageUrl.isNotEmpty)
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: Image.network(imageUrl,
                                    width: double.infinity,
                                    height: 197.6.h,
                                    fit: BoxFit.cover)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                ProductModel pro = ProductModel(
                    price: double.parse(price.text),
                    imageUrl: imageUrl,
                    productName: name.text,
                    docId: "",
                    productDescription: description.text,
                    categoryId: "0");
                context.read<ProductsViewModel>().insertProducts(pro, context);
                LocalNotificationService.localNotificationService.showNotification(title: "Qoshildi", body: "${name.text} qoshildi !!!", id: 0);
                Navigator.pop(context);
              },
              child: Text(
                "Add Product",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),
              ))
        ],
      )),
      backgroundColor: Colors.white,
    );
  }

  Future<void> _getImageFromCamera() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      imageUrl = await context.read<ImageViewModel>().uploadImage(
            pickedFile: image,
            storagePath: storagePath,
          );

      debugPrint("DOWNLOAD URL:$imageUrl");
    }
  }

  Future<void> _getImageFromGallery() async {
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1024,
      maxWidth: 1024,
    );
    if (image != null && context.mounted) {
      debugPrint("IMAGE PATH:${image.path}");
      storagePath = "files/images/${image.name}";
      imageUrl = await context.read<ImageViewModel>().uploadImage(
            pickedFile: image,
            storagePath: storagePath,
          );

      debugPrint("DOWNLOAD URL:$imageUrl");
    }
  }

  takeAnImage() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.h),
              ListTile(
                onTap: () async {
                  await _getImageFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo_album_outlined),
                title: const Text("Gallereyadan olish"),
              ),
              ListTile(
                onTap: () async {
                  await _getImageFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Kameradan olish"),
              ),
              SizedBox(height: 24.h),
            ],
          );
        });
  }
}
