import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:solarapp/Models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebaseauthservices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,
    required String gender,
    required DateTime dateOfBirth,
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
          gender: gender,
          dateOfBirth: dateOfBirth,
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

  Future<bool> checkEmailExists(String email) async {
    final QuerySnapshot result =
        await FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .limit(1)
            .get();
    return result.docs.isNotEmpty;
  }

  Future<bool> resetPasswordByEmail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Password reset email sent to $email');
      return true;
    } catch (e) {
      print('Failed to send reset email: $e');

      return false;
    }
  }


  Future<String?> updatePassword(String newPassword) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        await _auth.signOut(); // Optional: force re-login after password change
        return null; // success
      } else {
        return 'No user is currently logged in.';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return 'Please reauthenticate and try again.';
      } else {
        return 'Error: ${e.message}';
      }
    } catch (e) {
      return 'Unexpected error occurred.';
    }
  }
}
