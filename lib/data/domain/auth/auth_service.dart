import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //GETTERS
  FirebaseAuth get auth => _auth;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;

  User? getCurUser() {
    return _auth.currentUser;
  }

  //DEFAULT REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // update displayName/Pass and reload user
      await userCredential.user?.updateDisplayName(displayName);
      await userCredential.user?.updatePassword(password);
      await userCredential.user?.reload();

      //get updated user
      User? user = _auth.currentUser;

      await _firebaseFirestore.collection('Users').doc(user!.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'password': password,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Register error: $e');
    } catch (e) {
      throw Exception('Сталася помилка : $e');
    }
  }

  //DEFAULT LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Login error: $e');
    } catch (e) {
      throw Exception('Сталася помилка $e');
    }
  }

  // REGISTER WITH GOOGLE
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
        throw Exception('Login Error. User == null');
      }

      final userDoc =
          await _firebaseFirestore.collection('Users').doc(user.uid).get();

      if (!userDoc.exists) {
        _firebaseFirestore.collection('Users').doc(user.uid).set({
          'uid': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoUrl': user.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
        });
        print('User successfuly addet to Firestore');
      } else {
        print('User already exist');
      }

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception('Exception: $e');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  //LOGIN WITH GOOGLE
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
        throw Exception('User was NOT FOUND in DATA BASE');
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception('Error login with Google: $e');
    } catch (e) {
      throw Exception('Login Error: $e');
    }
  }

  Future<void> deleteAccount() async {
    User? user = _auth.currentUser;

    if (user != null) {
      //DELETE FROM FIREBASE
      await _firebaseFirestore.collection('Users').doc(user.uid).delete();

      // DELETE FROM AUTH
      await user.delete();
    }
  }

  Future<void> logout() async {
    return await _auth.signOut();
  }

  String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'Exception wrong-password':
        return 'The password is incorrect. Please try again';
      case 'Exception user-not-found':
        return 'No user fount with this email. Please sign in';
      case 'Exception email does not exist':
        return 'This email does not exist';
      default:
        return 'An unexpected error occured. Pleasy try again later.';
    }
  }
}
