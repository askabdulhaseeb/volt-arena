import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:volt_arena_app/database/user_api.dart';
import 'package:volt_arena_app/models/app_user.dart';
import 'package:volt_arena_app/widgets/custom_toast.dart';
import 'user_local_data.dart';

class AuthMethod {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<bool> loginAnonymosly() async {
    try {
      await _auth.signInAnonymously();
      return true;
    } catch (error) {
      CustomToast.errorToast(message: error.toString());
    }
    return false;
  }

  Future<bool> signinWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          var date = DateTime.now().toString();
          var dateparse = DateTime.parse(date);
          var formattedDate =
              "${dateparse.day}-${dateparse.month}-${dateparse.year}";
          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          final AppUser _appUser = AppUser(
            id: authResult.user!.uid,
            name: authResult.user!.displayName,
            email: authResult.user!.email,
            phoneNo: authResult.user!.phoneNumber,
            imageUrl: authResult.user!.photoURL,
            joinedAt: formattedDate,
            createdAt: Timestamp.now(),
          );
          final bool _isOkay = await UserAPI().addUser(_appUser);
          if (_isOkay) {
            UserLocalData().storeAppUserData(appUser: _appUser);
          } else {
            return false;
          }
          return true;
        } catch (error) {
          CustomToast.errorToast(message: error.toString());
        }
      }
    }
    return false;
  }

  Future<User?> signupWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth
          .createUserWithEmailAndPassword(
        email: email.toLowerCase().trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        CustomToast.errorToast(message: obj.toString());
      });
      final User? user = result.user;
      assert(user != null);
      return user;
    } catch (signUpError) {
      CustomToast.errorToast(message: signUpError.toString());
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential result = await _auth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .catchError((Object obj) {
        CustomToast.errorToast(message: obj.toString());
      });
      final User? user = result.user;
      final DocumentSnapshot<Map<String, dynamic>> docs =
          await UserAPI().getInfo(uid: user!.uid);
      final AppUser appUser = AppUser.fromDocument(docs);
      UserLocalData().storeAppUserData(appUser: appUser);
      return user;
    } catch (signUpError) {
      CustomToast.errorToast(message: signUpError.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    UserLocalData.signout();
    await _auth.signOut();
  }
}
