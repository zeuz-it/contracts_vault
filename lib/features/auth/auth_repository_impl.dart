import 'package:contracts_vault/features/auth/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_service.dart';
import '../database/database_service.dart';
import '../models/user_model.dart';

/* 
  Repository sınıfı, service sınıfının üzerinde bir katman olarak hareket edecektir. 
  Dolayısıyla, burada signUp, signIn ve signOut gibi kimlik doğrulamalarıyla ilgili 
  normal işlemlerimiz var. Ayrıca kullanıcı adını almak için bir yöntem ve mevcut 
  kullanıcıyı almak için başka bir yöntem oluşturuyoruz.
*/

class AuthRepositoryImpl implements AuthRepository {
  AuthService service = AuthService();
  DatabaseService dbService = DatabaseService();
  /* 
    AuthRepository sınıfının da hem DatabaseService hem de AuthService sınıfına 
    bağımlılığı olacaktır. Öğreticinin basitliği için bu hizmetleri enjekte etmek 
    için herhangi bir bağımlılık enjeksiyonu(dependency injection) kullanmadım, ancak 
    bir prod uygulamasında DI(dependency injection) kullanmak daha iyidir.
  */

  @override
  Stream<UserModel> getCurrentUser() {
    return service.retrieveCurrentUser();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return service.signUp(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    try {
      return service.signIn(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() {
    try {
      return service.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signInWithFacebook() {
    try {
      return service.signInWithFacebook();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signInWithApple() {
    try {
      return service.signInWithApple();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }
}

abstract class AuthRepository {
  Stream<UserModel> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> signIn(UserModel user);
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithFacebook();
  Future<UserCredential?> signInWithApple();
  Future<void> signOut();
}
