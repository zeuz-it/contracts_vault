part of 'register_form_bloc.dart';

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

  FormsValidate reset(
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
    return const FormsValidate(
      email: "example@gmail.com",
      password: "",
      passwordAgain: "",
      isEmailValid: true,
      isPasswordValid: true,
      isPasswordAgainValid: true,
      isFormValid: false,
      isLoading: false,
      isFormValidateFailed: false,
      errorMessage: "",
      isFormSuccessful: false,
    );
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
  Bu bloc yaln??zca do??rulama i??in kullan??laca????ndan, ilk durum d??????nda yaln??zca bir 
  durum olu??turuyoruz. FormsValidate durumunu copyWith() metodunu kullanarak 
  g??ncelliyoruz. Burada Equatable paketini kullanmak ??ok ??nemlidir. Equatable paketi 
  hem === hem de hashcode'u dahili olarak ge??ersiz k??lar(override), bu da bizi manuel 
  olarak yapmaktan kurtar??r. Bu nedenle, props kulland??????n??zda ve t??m alanlar?? 
  ekledi??inizde, bu alanlardan biri de??i??ti??inde bir durum de??i??ikli??imiz olacakt??r.
*/ 