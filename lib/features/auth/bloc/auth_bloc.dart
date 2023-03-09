import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../auth_repository_impl.dart';
import '../../models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthStarted>((event, emit) async {
      emit(AuthLoading());
      try {
        UserModel user = await _authRepository.getCurrentUser().first;
        if (user.uid != "uid") {
          emit(const AuthSuccess());
        } else {
          emit(AuthFailure());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthFailure());
      }
    });
    on<AuthStartedWithGoogle>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.signInWithGoogle();
        UserModel user = await _authRepository.getCurrentUser().first;

        if (user.uid != "uid") {
          emit(const AuthSuccess());
        } else {
          emit(AuthFailure());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthFailure());
      }
    });
    on<AuthStartedWithFacebook>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.signInWithFacebook();
        UserModel user = await _authRepository.getCurrentUser().first;

        if (user.uid != "uid") {
          emit(const AuthSuccess());
        } else {
          emit(AuthFailure());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthFailure());
      }
    });
    on<AuthStartedWithApple>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authRepository.signInWithApple();
        UserModel user = await _authRepository.getCurrentUser().first;

        if (user.uid != "uid") {
          emit(const AuthSuccess());
        } else {
          emit(AuthFailure());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(AuthFailure());
      }
    });
    on<AuthSignedOut>((event, emit) async {
      emit(AuthLoading());

      await _authRepository.signOut();
      emit(AuthFailure());
    });
  }
}
