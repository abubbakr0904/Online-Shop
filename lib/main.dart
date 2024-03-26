import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/splash_screen/splash_screen.dart';
import 'package:qwerty/services/local_database.dart';
import 'package:qwerty/view_models/auth_model.dart';
import 'package:qwerty/view_models/login_viewmodel.dart';
import 'package:qwerty/view_models/product_view_model.dart';

import 'firebase_options.dart';

Future<void> main() async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  LocalNotificationService.localNotificationService.init(navigatorKey);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ProductsViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
