import 'dart:developer';

import 'package:app_test/src/app/ui/controller/shared_ctr.dart';
import 'package:app_test/src/app/ui/view/home/homepage.dart';
import 'package:app_test/src/app/ui/view/login/login_view.dart';
import 'package:app_test/src/app/ui/view/register/complete_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  User? user;

  void logIn() async {
    _sharedController.setLoading(true);
    final isLogin = await signInWithEmailAndPassword();
    if (isLogin) {
      Get.offAllNamed(HomePage.routeName);
    }

    _sharedController.setLoading(false);
  }

  // Iniciar sesión con correo electrónico y contraseña
  Future<bool> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: credentials.email,
        password: credentials.password,
      );
      if (userCredential.user != null) {
        user = userCredential.user;
        return true;
      }
      return false;
    } catch (e) {
      log('Error al iniciar sesión: $e');
      return false;
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
    } catch (e) {
      _sharedController.setLoading(false);
    }
  }

  Future<void> completeRegister(model.User data) async {
    _sharedController.setLoading(true);
    try {
      await _firestore.collection('users').doc(user?.uid).set(data.toMap());

      _sharedController.showDialogMessage("Registro Completo",
          "Gracias ya suministro la informacion de registro");
      _sharedController.setLoading(false);
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
}
