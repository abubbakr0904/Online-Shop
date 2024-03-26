import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qwerty/screens/home_screen/home_screen.dart';

import '../utils/regxps/reg_xp.dart';
import '../utils/widgets/snack_bars.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get loading => _isLoading;

  User? get getUser => FirebaseAuth.instance.currentUser;


  Future<void> signInWithGoogle(BuildContext context, [String? clientId]) async {
    // Trigger the authentication flow
    _notify(true);

    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(clientId: clientId).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    _notify(false);
    if (userCredential.user != null) {
      // Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
    }
  }

  registerUser(
      BuildContext context, {
        required String email,
        required String password,
        required String username,
      }) async {
    if (AppConstants.emailRegExp.hasMatch(email) &&
        AppConstants.passwordRegExp.hasMatch(password)) {
      try {
        _notify(true);
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
        }
        _notify(false);
        if (!context.mounted) return;
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      } on FirebaseAuthException catch (e) {
        if (!context.mounted) return;
        showErrorForRegister(e.code, context);
      } catch (error) {
        if (!context.mounted) return;
        showSnackbar(
          context: context,
          message: "Noma'lum xatolik yuz berdi:$error.",
        );
      }
    } else {
      showSnackbar(
        context: context,
        message: "Login yoki Parolni xato kiritdingiz!",
      );
    }
  }

  loginUser(
      BuildContext context, {
        required String email,
        required String password,
      }) async {
    if (AppConstants.emailRegExp.hasMatch(email) &&
        AppConstants.passwordRegExp.hasMatch(password)) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (!context.mounted) return;
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      } on FirebaseAuthException catch (err) {
        if (!context.mounted) return;
        showErrorForLogin(err.code, context);
      } catch (error) {
        if (!context.mounted) return;
        showSnackbar(
          context: context,
          message: "Noma'lum xatolik yuz berdi:$error.",
        );
      }
    } else {
      showSnackbar(
        context: context,
        message: "Login yoki Parolni xato kiritdingiz!",
      );
    }
  }

  logout(BuildContext context) async {
    _notify(true);
    await FirebaseAuth.instance.signOut();
    _notify(false);
    if (!context.mounted) return;
    // Navigator.pushReplacementNamed(context, RouteNames.loginRoute);
  }

  updateUsername(String username) async {
    _notify(true);
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
    _notify(false);
  }

  updateImageUrl(String imagePath) async {
    _notify(true);
    try {
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(imagePath);
    } catch (error) {
      debugPrint("ERROR:$error");
    }
    _notify(false);
  }

  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }

//
// verifyEmail(){
//   FirebaseAuth.instance.currentUser.sendEmailVerification();
// }
}
