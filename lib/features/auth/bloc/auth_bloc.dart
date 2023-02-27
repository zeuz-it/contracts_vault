/* 
  Bu dosya UI ve Veri katmanı(data layer) arasında bir aracı görevi görür, Bloc 
  kullanıcı tarafından tetiklenen bir olayı (örn: SignIn düğmesine basma, SignUp 
  düğmesine basma, vb.) girdi olarak alır ve ilgili durumla UI'a geri yanıt verir.

  Burada, kullanıcı tarafından talep edilen Olaylara(events) göre Durum(state) 
  yayacağız(emit).
*/
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    // Kullanıcı SignIn Düğmesine Bastığında, SignInRequested Olayını(event) işlemek
    //(handle) için AuthBloc'a göndereceğiz ve kullanıcının kimliği doğrulanmışsa
    //Authenticated Durumunu(state) yayacağız(emit).
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);

        if (!FirebaseAuth.instance.currentUser!.emailVerified) {
          authRepository.signOut();
          emit(AuthError("Email Onaylanmamış"));
          emit(UnAuthenticated());
        } else {
          emit(Authenticated());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // Kullanıcı SignUp düğmesine bastığında, SignUpRequest olayını AuthBloc'a
    // göndereceğiz ve kullanıcının kimliği doğrulanmışsa Authenticated durumunu(state)
    // yayacağız(emit)
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // Kullanıcı Google Giriş Düğmesine Bastığında, GoogleSignInRequest Olayını
    //(event) işlemek için AuthBloc'a göndereceğiz ve kullanıcının kimliği doğrulanmışsa
    //Authenticated Durumunu(state) yayacağız(emit).
    on<GoogleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithGoogle();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // Kullanıcı SignOut düğmesine bastığında, SignOutRequested olayını(event) işlemek
    //(handle) ve UnAuthenticated durumunu(state) yaymak(emit) için AuthBloc'a
    //göndereceğiz.

    on<FacebookSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithFacebook();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<AppleSignInRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signInWithApple();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
