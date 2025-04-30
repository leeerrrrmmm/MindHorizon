import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Регистрация Email/Пароль
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateDisplayName(displayName);
      await userCredential.user?.reload();

      final user = _auth.currentUser;

      await _firebaseFirestore.collection('Users').doc(user!.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': displayName,
        'phone': '',
        'createdAt': FieldValue.serverTimestamp(),
        'notificationSettings': {'vibration': true, 'sendNotification': true},
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Этот email уже зарегистрирован.');
      }
      throw Exception('Ошибка регистрации: ${e.code}');
    } catch (e) {
      throw Exception('Произошла ошибка: $e');
    }
  }

  // Вход Email/Пароль
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firebaseFirestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .update({'lastLogin': FieldValue.serverTimestamp()});

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Ошибка входа: ${e.code}');
    }
  }

  // Регистрация через Google
  Future<UserCredential?> registerGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) return null;

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user == null) {
        throw Exception('Ошибка авторизации. Пользователь = null.');
      }

      final userDoc =
          await _firebaseFirestore.collection('Users').doc(user.uid).get();

      if (!userDoc.exists) {
        await _firebaseFirestore.collection('Users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email ?? '',
          'displayName': user.displayName ?? 'Без имени',
          'photoUrl': user.photoURL ?? '',
          'phoneNumber': user.phoneNumber ?? '',
          'createdAt': FieldValue.serverTimestamp(),
          'notificationSettings': {'vibration': true, 'sendNotification': true},
        });
      }

      return userCredential;
    } catch (e) {
      throw Exception('Ошибка Google-регистрации: $e');
    }
  }

  // Вход через Google (если пользователь уже есть в базе)
  Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) return null;

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final userDoc =
          await _firebaseFirestore
              .collection('Users')
              .doc(userCredential.user!.uid)
              .get();

      if (!userDoc.exists) {
        throw Exception("Пользователь не найден в базе данных.");
      }

      return userCredential;
    } catch (e) {
      throw Exception('Ошибка входа через Google: $e');
    }
  }

  // Уведомления — Обновление настроек
  Future<void> updateNotificationSettings({
    required bool vibration,
    required bool sendNotification,
  }) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firebaseFirestore.collection('Users').doc(user.uid).update({
        'notificationSettings': {
          'vibration': vibration,
          'sendNotification': sendNotification,
        },
      });
    }
  }

  // Уведомления — Получение настроек
  Future<Map<String, dynamic>> getNotificationSettings() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection('Users').doc(user.uid).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        final notification = data['notificationSettings'] ?? {};
        return {
          'vibration': notification['vibration'] ?? false,
          'sendNotification': notification['sendNotification'] ?? false,
        };
      }
    }
    return {'vibration': false, 'sendNotification': false};
  }

  // Удаление пользователя
  Future<void> deleteUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firebaseFirestore.collection('Users').doc(user.uid).delete();
      await user.delete();
    }
  }

  Future<void> logout() async {
    try {
      // Получаем текущего пользователя
      User? user = _auth.currentUser;

      // Проверяем, использовался ли Google при входе
      for (final info in user?.providerData ?? []) {
        if (info.providerId == 'google.com') {
          // Если вход через Google — нужно выйти и из Google аккаунта
          await GoogleSignIn().signOut();
        }
      }

      // Основной выход из Firebase
      await _auth.signOut();
    } catch (e) {
      log("Ошибка при выходе: $e");
    }
  }

  // Сброс пароля
  Future<void> resetUserPassword(
    String password,
    String confirmPassword,
  ) async {
    User? user = _auth.currentUser;
    if (user != null && password == confirmPassword) {
      await user.updatePassword(password);
      await _firebaseFirestore.collection('Users').doc(user.uid).update({
        'password': password,
      });
    }
  }

  // Обновление профиля
  Future<void> editProfile(String name, String email) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // Проверка email перед его обновлением
        await user.verifyBeforeUpdateEmail(email);

        // После того как email прошел проверку, обновляем имя
        await user.updateDisplayName(name);

        // Обновление данных в Firestore
        await _firebaseFirestore.collection('Users').doc(user.uid).update({
          'displayName': name,
          'email': email,
        });
      } catch (e) {
        throw Exception('Ошибка обновления профиля: $e');
      }
    }
  }

  // Сообщения об ошибках
  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'Exception wrong-password':
        return 'Пароль неверный. Попробуйте снова.';
      case 'Exception user-not-found':
        return 'Пользователь с таким email не найден.';
      case 'Exception email-already-in-use':
        return 'Этот email уже зарегистрирован.';
      default:
        return 'Произошла непредвиденная ошибка. Попробуйте позже.';
    }
  }
}
