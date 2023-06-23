import 'dart:developer';

import 'package:app_test/src/app/ui/controller/shared_ctr.dart';
import 'package:app_test/src/app/ui/view/home/homepage.dart';
import 'package:app_test/src/app/ui/view/login/login_view.dart';
import 'package:app_test/src/app/ui/view/register/complete_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/models/auth_credentials.dart';
import '../../../core/models/user.dart' as model;

class SessionController extends GetxController {
  static SessionController initializeController() {
    try {
      SessionController controller = Get.find<SessionController>();
      return controller;
    } catch (e) {
      SessionController controller = Get.put(SessionController());
      return controller;
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final LoginCredentials credentials =
      LoginCredentials(email: "", password: "");

  final SharedController _sharedController =
      SharedController.initializeController();

  RxBool isObscured = true.obs;

  RxList<dynamic> address_user = [].obs;

  User? user;
  Map<String, dynamic> dataMap = {};

  void logIn() async {
    _sharedController.setLoading(true);
    final isLogin = await signInWithEmailAndPassword();
    if (isLogin.contains('true')) {
      await getDocumentById(user?.uid ?? '');
      Get.offAllNamed(HomePage.routeName);
    } else {
      if (isLogin.contains("Given String is empty or null")) {
        _sharedController.showDialogMessage(
            "Upsh!!", "Tienes los campos vacios");
      }

      if (isLogin.contains(
          "The password is invalid or the user does not have a password.")) {
        _sharedController.showDialogMessage(
            "Upsh!!", "Contraseña incorrecta. Verifica tus credenciales.");
      }
      if (isLogin.contains(
          "There is no user record corresponding to this identifier. The user may have been deleted.")) {
        _sharedController.showDialogMessage(
            "Upsh!!", "Usuario no esta registrado. Verifica tus credenciales.");
      }
    }

    _sharedController.setLoading(false);
  }

  Future<Map<String, dynamic>> getDocumentById(String documentId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(documentId)
          .get();

      if (documentSnapshot.exists) {
        Object? dataUser = documentSnapshot.data();
        if (dataUser is Map<String, dynamic>) {
          dataMap = dataUser;
          address_user.value = dataMap["addresses"];
        }
      }
      return dataMap;
    } on FirebaseException catch (e) {
      log('Error de Firebase al obtener el documento: $e');
      return dataMap;
    } catch (e) {
      log('Error al obtener el documento: $e');
      return dataMap;
    }
  }

  // Iniciar sesión con correo electrónico y contraseña
  Future<String> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );
      if (userCredential.user != null) {
        user = userCredential.user;
        return 'true';
      }
      return '';
    } on FirebaseAuthException catch (e) {
      log('Error al iniciar sesión: $e');
      return e.message ?? '';
    }
  }

  Future<void> createUser() async {
    _sharedController.setLoading(true);
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: credentials.email, // Agrega aquí el email del usuario
        password: credentials.password, // Agrega aquí la contraseña del usuario
      );
      if (userCredential.user != null) {
        user = userCredential.user;
        userIDSave();
        _sharedController.showDialogMessage(
            "Registro Exitoso", "felicidades su usuario se creo correctamente");
        Get.offAllNamed(CompleteRegisterScreen.routeName);
        _sharedController.setLoading(false);
      }
      _sharedController.setLoading(false);
    } on FirebaseAuthException catch (e) {
      if (e.message?.contains("Password should be at least 6 characters") ??
          false) {
        _sharedController.showDialogMessage(
            "Upsh!!", "La Contraseña debe tenr minimo su caracteres");
      }
      _sharedController.setLoading(false);
    }
  }

  Future<void> completeRegister(model.User data) async {
    _sharedController.setLoading(true);
    try {
      await _firestore.collection('users').doc(user?.uid).set(data.toJson());

      _sharedController.showDialogMessage("Registro Completo",
          "Gracias ya suministro la informacion de registro");
      await getDocumentById(user?.uid ?? '');
      Get.offAllNamed(HomePage.routeName);
    } catch (e) {
      _sharedController.setLoading(false);
    }
  }

  Future<void> userIDSave() async {
    try {
      _firestore.collection('users').doc(user?.uid);
    } catch (e) {}
  }

// Cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }

  void logOut() async {
    _sharedController.setLoading(true);
    signOut();
    Get.offAllNamed(LoginScreen.routeName);
    _sharedController.setLoading(false);
  }

  Future<void> updateListItem(String userUid) async {
    try {
      DocumentReference documentRef =
          FirebaseFirestore.instance.collection('users').doc(userUid);

      await documentRef.update({'addresses': address_user.toList()});

      _sharedController.showDialogMessage(
          "Direccion Agrega", "Direccion agregada con exito");
    } on FirebaseException catch (e) {
      print('Error al actualizar el elemento: $e');
    }
  }
}
