import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth/auth_repository_impl.dart';
import '../../database/database_repository_impl.dart';
import '../../models/user_model.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsValidate> {
  final AuthRepository _AuthRepository;
  final DatabaseRepository _databaseRepository;
  /* 
    Burada, FormBloc hem AuthenticationRepository hem de DatabaseRepository üzerinde 
    bir bağımlılığa sahip olacaktır. Ayrıca on olay işleyicisini, oluşabilecek her 
    olayın türünü atayarak kullanırız. Örneğin onEmailChanged'de aşağıdakileri 
    yapıyoruz.
  */
  FormBloc(this._AuthRepository, this._databaseRepository)
      : super(
          const FormsValidate(
              email: "example@gmail.com",
              password: "",
              passwordAgain: "",
              isEmailValid: true,
              isPasswordValid: true,
              isPasswordAgainValid: true,
              isFormValid: false,
              isLoading: false,
              isFormValidateFailed: false),
        ) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordAgainChanged>(_onPasswordAgainChanged);
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

  bool _isPasswordAgainValid(String password, String passwordAgain) {
    return password == passwordAgain ? true : false;
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

  _onPasswordAgainChanged(
      PasswordAgainChanged event, Emitter<FormsValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: false,
      isFormValidateFailed: false,
      errorMessage: "",
      passwordAgain: event.passwordAgain,
      isPasswordAgainValid:
          _isPasswordAgainValid(event.password, event.passwordAgain),
    ));
  }

  _onFormSubmitted(FormSubmitted event, Emitter<FormsValidate> emit) async {
    UserModel user = UserModel(
      email: state.email,
      password: state.password,
      passwordAgain: state.passwordAgain,
    );

    if (event.value == Status.signUp) {
      await _updateUIAndSignUp(event, emit, user);
    } else if (event.value == Status.signIn) {
      await _authenticateUser(event, emit, user);
    }
  }
  /* 
    Burada, Status türünde bir örnek değişkene sahip olan FormSubmitted olayını 
    kullanıyorum. Böylece, önce UserModel sınıfını başlatıyorum ve ardından Status 
    değerine göre _updateUIAndSignUp() veya _authenticateUser() çağırıyorum.
  */

  _updateUIAndSignUp(
      FormSubmitted event, Emitter<FormsValidate> emit, UserModel user) async {
    emit(state.copyWith(
        errorMessage: "",
        isFormValid: _isPasswordValid(state.password) &&
            _isEmailValid(state.email) &&
            _isPasswordAgainValid(state.password, state.passwordAgain),
        isLoading: true));
    if (state.isFormValid) {
      try {
        UserCredential? authUser = await _AuthRepository.signUp(user);
        UserModel updatedUser = user.copyWith(
            uid: authUser!.user!.uid, isVerified: authUser.user!.emailVerified);
        await _databaseRepository.saveUserData(updatedUser);
        if (updatedUser.isVerified!) {
          emit(state.copyWith(isLoading: false, errorMessage: ""));
        } else {
          emit(
            state.copyWith(
              isFormValid: false,
              errorMessage:
                  "Please Verify your email, by clicking the link sent to you by mail.",
              isLoading: false,
              email: "",
              password: "",
            ),
          );
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
    ilk olarak formun geçerli olup olmadığını kontrol edecek ve isLoading'e true 
    atayacak ve ekranda bir CircularProgressIndicator gösterecek yeni bir state emit() 
    ediyorum(yayıyorum). Daha sonra form geçerliyse, AuthenticationRepository'de daha 
    önce gördüğümüz signUp() yöntemini çağırıyorum, ardından copyWith() yöntemini 
    çağırıyorum ve yeni bir UserModel örneği döndürüyorum. Bundan sonra, verileri 
    Cloud Firestore'a ekleyecek olan saveUserData() metodunu çağırıyorum, bunu bir 
    sonraki bölümde göreceğiz.

    Kullanıcı doğrulanırsa, isLoading'e false atayarak ve herhangi bir errorMessage'ı 
    kaldırarak CircularProgressIndicator'ı kaldırırız, aksi takdirde yukarıdaki 
    mesajla birlikte bir hata gösteririz.
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
