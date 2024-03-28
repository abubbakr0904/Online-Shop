import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/produts_screen/widgtes/add_category_screen/add_category_screen.dart';
import 'package:qwerty/screens/produts_screen/widgtes/widget.dart';
import 'package:qwerty/utils/images/images.dart';

import '../../data/models/product_model.dart';
import '../../data/network/api_provider.dart';
import '../../services/local_database.dart';
import '../../view_models/product_view_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>const AddProducts()));
              },
              style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.2)),
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ],
        ),
        body: const CommunityScreen());
  }
}

_showSnackbar({required String text}) {
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
  );
}
