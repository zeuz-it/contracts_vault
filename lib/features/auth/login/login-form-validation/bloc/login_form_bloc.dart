import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../auth_repository_impl.dart';
import '../../../../database/database_repository_impl.dart';
import '../../../../models/user_model.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<FormEvent, FormsValidate> {
  final AuthRepository _AuthRepository;
  final DatabaseRepository _databaseRepository;
  /* 
    Burada, FormBloc hem AuthenticationRepository hem de DatabaseRepository üzerinde 
    bir bağımlılığa sahip olacaktır. Ayrıca on olay işleyicisini, oluşabilecek her 
    olayın türünü atayarak kullanırız. Örneğin onEmailChanged'de aşağıdakileri 
    yapıyoruz.
  */
  LoginFormBloc(this._AuthRepository, this._databaseRepository)
      : super(
          const FormsValidate(
            email: "example@gmail.com",
            password: "",
            isEmailValid: true,
            isPasswordValid: true,
            isFormValid: false,
            isLoading: false,
            isFormValidateFailed: false,
          ),
        ) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
    on<FormSucceeded>(_onFormSucceeded);
  }
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  _onEmailChanged(EmailChanged event, Emitter<FormsValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: false,
      isFormValidateFailed: false,
      errorMessage: "",
      email: event.email,
      isEmailValid: _isEmailValid(event.email),
    ));
  }
  /* 
    Burada, state'i güncellemek ve FormsBloc türündeki BlocBuilder, BlocListener veya 
    BlocConsumer tarafından gözlemlenecek yeni bir state yaymak için copyWith() 
    yöntemini kullanıyorum. copyWith() içinde, bu durumun tüm alanlarını tekrar 
    başlatıyorum ve e-postanın regex'e göre geçerli bir e-posta olup olmadığını 
    kontrol etmek için _isEmailValid() yöntemini kullanıyorum. Aynı şey diğer 
    metotlarla aşağıdaki gibi yapılıyor.
  */

  _onPasswordChanged(PasswordChanged event, Emitter<FormsValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: false,
      isFormValidateFailed: false,
      errorMessage: "",
      password: event.password,
      isPasswordValid: _isPasswordValid(event.password),
    ));
  }

  _onFormSubmitted(FormSubmitted event, Emitter<FormsValidate> emit) async {
    UserModel user = UserModel(
      email: state.email,
      password: state.password,
    );

    await _authenticateUser(event, emit, user);
  }
  /* 
    Burada, Status türünde bir örnek değişkene sahip olan FormSubmitted olayını 
    kullanıyorum. Böylece, önce UserModel sınıfını başlatıyorum ve ardından Status 
    değerine göre _updateUIAndSignUp() veya _authenticateUser() çağırıyorum.
  */

  _authenticateUser(
      FormSubmitted event, Emitter<FormsValidate> emit, UserModel user) async {
    emit(state.copyWith(
        errorMessage: "",
        isFormValid:
            _isPasswordValid(state.password) && _isEmailValid(state.email),
        isLoading: true));
    if (state.isFormValid) {
      try {
        UserCredential? authUser = await _AuthRepository.signIn(user);
        UserModel updatedUser =
            user.copyWith(isVerified: authUser!.user!.emailVerified);
        if (updatedUser.isVerified!) {
          emit(state.copyWith(isLoading: false, errorMessage: ""));
        } else {
          emit(state.copyWith(
              isFormValid: false,
              errorMessage:
                  "Please Verify your email, by clicking the link sent to you by mail.",
              isLoading: false));
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: e.message, isFormValid: false));
      }
    } else {
      emit(state.copyWith(
          isLoading: false, isFormValid: false, isFormValidateFailed: true));
    }
  }
  /* 
    _authenticateUser() yöntemi de _updateUIAndSignUp() ile aynıdır, ancak signIn() 
    yöntemini çağırırız ve yalnızca parola ve e-postanın geçerli olup olmadığını 
    kontrol ederiz.
  */

  _onFormSucceeded(FormSucceeded event, Emitter<FormsValidate> emit) {
    emit(state.copyWith(isFormSuccessful: true));
  }
}
