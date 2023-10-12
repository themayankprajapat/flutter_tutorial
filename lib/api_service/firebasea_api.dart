import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseApi {
  FireBaseApi._();

  static FireBaseApi instance = FireBaseApi._();

  User? user;

  Future<User?> signUp(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      debugPrint(credential.user.toString());
      user = credential.user;
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<User?> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      debugPrint(credential.user.toString());
      user = credential.user;
      return credential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
