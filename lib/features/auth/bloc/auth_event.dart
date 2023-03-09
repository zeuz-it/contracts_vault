part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {
      @override
  List<Object> get props => [];
}

class AuthStartedWithGoogle extends AuthEvent {
      @override
  List<Object> get props => [];
}

class AuthStartedWithFacebook extends AuthEvent {
      @override
  List<Object> get props => [];
}

class AuthStartedWithApple extends AuthEvent {
      @override
  List<Object> get props => [];
}

class AuthSignedOut extends AuthEvent {
      @override
  List<Object> get props => [];
}
/* 
  Burada görebileceğiniz gibi AuthStarted ve AuthSignedOut olmak 
  üzere iki eventımız var. Hatırlarsanız main.dart'ta kimlik doğrulama işlemini 
  başlatmak için hemen AuthStarted olayını eklemiştik.
*/ 