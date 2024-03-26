import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qwerty/screens/home_screen/home_screen.dart';

class LoginViewModel extends ChangeNotifier {
  String email = "";
  String password = "";

  updateEmail(String v) {
    email = v;
    notifyListeners();

  }

  updatePassword(String v) {
    password = v;
    notifyListeners();
  }

  login(BuildContext context) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.uid.isNotEmpty) {
        debugPrint("UID:${credential.user!.uid}");
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      }
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("Xato");
    }
    notifyListeners();

  }
}