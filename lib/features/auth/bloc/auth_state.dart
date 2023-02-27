/* 
  Kullanıcı arayüzü(UI), Bloc'tan aldığı duruma(state) göre güncellenecektir.
  Bizim durumumuzda, 4 farklı state'imiz var: 
    -Loading(Yükleniyor), 
    -Authenticated(Kimliği Doğrulanmış), 
    -UnAuthenticated(Kimliği Doğrulanmamış),
    -AuthError.
*/ 
part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

// Kullanıcı oturum açma(sign in) veya kaydolma(sign up) düğmesine bastığında state 
//önce yükleniyor(loading), ardından Kimliği Doğrulanmış(authenticated) olarak 
//değiştirilir.
class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

// Kullanıcının kimliği doğrulandığında(authenticated) state Kimliği Doğrulanmış 
//(authenticated) olarak değiştirilir.
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// Bu, bloc'un ilk state'dir. Kullanıcının kimliği doğrulanmadığında(unauthenticated) 
// state Kimliği Doğrulanmamış(unauthenticated) olarak değiştirilir.
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class EmailIsNotVerified extends AuthState {
  @override
  List<Object?> get props => [];
}

// Herhangi bir hata oluşursa state AuthError olarak değiştirilir.
class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}