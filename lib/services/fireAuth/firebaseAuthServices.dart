import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:solarapp/Models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebaseauthservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<String?> register({
  //   required String email,
  //   required String password,
  //   required String firstname,
  //   required String lastname,
  //   required String phone,
  // }) async {
  //   try {
  //     UserCredential userCred = await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );

  //     User? user = userCred.user;
  //     if (user != null) {
  //       UserModel usermodel = UserModel(
  //         uid: user.uid,
  //         firstName: firstname,
  //         lastName: lastname,
  //         email: email,
  //         phone: phone,
  //       );

  //       await _firestore
  //           .collection('users')
  //           .doc(user.uid)
  //           .set(usermodel.toMap());
  //       return "account created";
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'email-already-in-use') {
  //       print("Email is already in use.");
  //       // You can also show a snackbar or custom message in the UI
  //     } else {
  //       print("Firebase Auth error: ${e.code}");
  //     }
  //   } catch (e) {
  //     print("Register error: $e");
  //     return null;
  //   }
  //   return null;
  // }
  Future<String?> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,
  }) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCred.user;
      if (user != null) {
        UserModel usermodel = UserModel(
          uid: user.uid,
          firstName: firstname,
          lastName: lastname,
          email: email,
          phone: phone,
        );

        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(usermodel.toMap());

        return "account created";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "This email is already in use.";
      } else if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'invalid-email') {
        return "The email address is badly formatted.";
      }
      return "Registration failed: ${e.message}";
    } catch (e) {
      print("Register error: $e");
      return "Unexpected error occurred. Please try again.";
    }
    return null;
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCred.user;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          return UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        }
        print("User document does not exist");

        return null;
      }
    } catch (e) {
      print("Login error: $e");
      return null;
    }
    return null;
  }
}
