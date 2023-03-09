part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  const FormState();
}

class FormInitial extends FormState {
  @override
  List<Object?> get props => [];
}

class FormsValidate extends FormState {
  const FormsValidate(
      {required this.email,
      required this.password,
      required this.passwordAgain,
      required this.isEmailValid,
      required this.isPasswordValid,
      required this.isPasswordAgainValid,
      required this.isFormValid,
      required this.isLoading,
      this.errorMessage = "",      
      required this.isFormValidateFailed,
      this.isFormSuccessful = false});

  final String email;
  final String password;
  final String passwordAgain;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isPasswordAgainValid;
  final bool isFormValid;  
  final bool isFormValidateFailed;
  final bool isLoading;
  final String errorMessage;
  final bool isFormSuccessful;

  FormsValidate copyWith(
      {String? email,
      String? password,
      String? passwordAgain,
      bool? isEmailValid,
      bool? isPasswordValid,
      bool? isPasswordAgainValid,
      bool? isFormValid,
      bool? isLoading,
      String? errorMessage,      
      bool? isFormValidateFailed,
      bool? isFormSuccessful}) {
    return FormsValidate(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordAgain: passwordAgain ?? this.passwordAgain,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isPasswordAgainValid: isPasswordAgainValid ?? this.isPasswordAgainValid,
        isFormValid: isFormValid ?? this.isFormValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isFormValidateFailed: isFormValidateFailed ?? this.isFormValidateFailed,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        passwordAgain,
        isEmailValid,
        isPasswordValid,
        isPasswordAgainValid,
        isFormValid,
        isLoading,
        errorMessage,
        isFormValidateFailed,
        isFormSuccessful
      ];
}

/* 
  Bu bloc yalnızca doğrulama için kullanılacağından, ilk durum dışında yalnızca bir 
  durum oluşturuyoruz. FormsValidate durumunu copyWith() metodunu kullanarak 
  güncelliyoruz. Burada Equatable paketini kullanmak çok önemlidir. Equatable paketi 
  hem === hem de hashcode'u dahili olarak geçersiz kılar(override), bu da bizi manuel 
  olarak yapmaktan kurtarır. Bu nedenle, props kullandığınızda ve tüm alanları 
  eklediğinizde, bu alanlardan biri değiştiğinde bir durum değişikliğimiz olacaktır.
*/ 