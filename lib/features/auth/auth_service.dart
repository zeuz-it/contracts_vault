import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  /* 
    AuthenticationService içinde nihayet Firebase API kullanıyoruz!
    Önce bir FirebaseAuth örneği(instance) alıyoruz. 
  */ 
  Stream<UserModel> retrieveCurrentUser() {
    return auth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserModel(uid: user.uid, email: user.email);
      } else {
        return UserModel(uid: "uid");
      }
    });
  }
  /* 
    authStateChanges() metodu kullanıcının kimlik doğrulama durumuyla ilgili herhangi 
    bir değişikliği dinler. Kullanıcı null değilse, geçerli bir userId ile bir 
    UserModel örneği döndürürüz, aksi takdirde kullanıcının oturum açmadığı anlamına 
    gelen string uid ile bir UserModel örneği döndürürüz.
  */ 

  Future<UserCredential?> signUp(UserModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      await verifyEmail();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
  /* 
    Firebase kimlik doğrulama konsolunda yeni bir kullanıcı oluşturmak için 
    createUserWithEmailAndPassword() işlevini çağırıyoruz, ayrıca kullanıcının kayıt 
    formuna eklediği e-postayı doğrulayacak verifyEmail() işlevini de çağırıyoruz.
  */ 

  Future<UserCredential?> signIn(UserModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email!, password: user.password!);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
  /* 
    Ardından, kullanıcıda oturum açacak veya örneğin e-postanın kimliği doğrulanmamışsa 
    bir hata döndürecek signInWithEmailAndPassword() yöntemini içerecek signIn() 
    yöntemini oluşturuyoruz. Ayrıca kullanıcının oturumunu kapatmak için bir signOut() 
    metodu oluşturuyoruz.
  */ 

  Future<void> verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      return await user.sendEmailVerification();
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential;
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      var userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserCredential?> signInWithApple() async {
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
      return userCredential;
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
    return await FirebaseAuth.instance.signOut();
  }
}
