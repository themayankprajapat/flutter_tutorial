import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tutorial/todo_app/todo_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseApi {
  FireBaseApi._();

  static FireBaseApi instance = FireBaseApi._();

  User? user;

  Future<User?> signUp(String email, String password, String name) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      debugPrint(credential.user.toString());
      user = credential.user;
      // if (user != null) {
      //   await user?.updateDisplayName(name);
      //   createUser(name, user!.email!, user!.uid);
      // }
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

  Future<void> createTodo(TodoModel model) async {
    final user = FirebaseAuth.instance.currentUser;
    final todos = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('todos');
    await todos.add(model.toMap()).then((value) {
      log(
        value.id + '  ' + value.path + "  " + value.parent.toString(),
        name: 'createTodo',
      );
    }).catchError((e) {
      log(e.toString(), name: 'createTodo');
    });
  }

  Future<void> createUser(String username, String email, String docId) async {
    DocumentReference users =
        FirebaseFirestore.instance.collection('users').doc(docId);
    await users.set({"user_name": username, "title": email}).then((value) {
      log('success', name: 'createUser');
    }).catchError((e) {
      log(e.toString(), name: 'createUser');
    });
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getTodo() async {
    final user = FirebaseAuth.instance.currentUser;
    final todos = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('todos');
    final res = await todos.get();
    return res.docs;
  }
}
