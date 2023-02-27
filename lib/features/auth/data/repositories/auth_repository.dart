import 'package:blur/blur.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  /* 
    Bu yöntem oldukça basittir; e-posta ve şifreyi createUserWithEmailAndPassword() 
    fonksiyonuna göndeririz ve gerisini o halleder.

    Ayrıca hataları ele almak için zayıf şifre(weak-password) ve e-posta zaten 
    kullanımda(email already in use) için çeşitli İstisnalar(exceptions) atıyorum.
  */

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signInWithApple() async {
    /* 
      Rehber => https://github.com/nickmeinhold/apple-sign-in-flutter-firebase
      Package => https://pub.dev/packages/sign_in_with_apple
      Glitch => https://glitch.com/~ninth-pear-jitterbug
    */
    try {
      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'apple sign in flutter firebase',
          redirectUri: Uri.parse(
            'https://ninth-pear-jitterbug.glitch.me/callbacks/sign_in_with_apple',
          ),
        ),
      );

      final oAuthCredential = OAuthProvider('apple.com').credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );

      // Use the OAuthCredential to sign in to Firebase.
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  /* 
    Google Sign In için signInWithGoogle adında bir yöntem oluşturalım. Bu metot, 
    Google Oturum Açma İletişim Kutusunu görüntülemekten ve bir Google hesabıyla 
    oturum açmaktan sorumludur.
  */
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  String user() {
    return _firebaseAuth.currentUser.toString();
  }
}
