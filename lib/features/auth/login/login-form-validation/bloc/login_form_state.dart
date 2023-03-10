part of 'login_form_bloc.dart';

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
      required this.isEmailValid,
      required this.isPasswordValid,      
      required this.isFormValid,
      required this.isLoading,
      this.errorMessage = "",      
      required this.isFormValidateFailed,
      this.isFormSuccessful = false});
  
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;  
  final bool isFormValid;  
  final bool isFormValidateFailed;
  final bool isLoading;
  final String errorMessage;
  final bool isFormSuccessful;

  FormsValidate copyWith(
      {String? email,
      String? password,
      bool? isEmailValid,
      bool? isPasswordValid,      
      bool? isFormValid,
      bool? isLoading,
      String? errorMessage,      
      bool? isFormValidateFailed,
      bool? isFormSuccessful}) {
    return FormsValidate(
        email: email ?? this.email,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
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
        isEmailValid,
        isPasswordValid,
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