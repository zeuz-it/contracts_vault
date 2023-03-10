part of 'login_form_bloc.dart';

enum Status { signIn, signUp }

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends FormEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends FormEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class FormSubmitted extends FormEvent {
  final Status value;
  const FormSubmitted({required this.value});

  @override
  List<Object> get props => [value];
}

class FormSucceeded extends FormEvent {
  const FormSucceeded();

  @override
  List<Object> get props => [];
}
/* 
  Burada, oturum açma(sign in) ve kaydolma(sign up) arasında ayrım yapmak için Status 
  adında bir enum oluşturuyoruz. Daha sonra her alan için bir olay(event) oluşturuyoruz, 
  örneğin e-posta adlı bir alanı da içeren EmailChanged olayımız var. Bu olayları her 
  TextFormField'ın onChanged()'ine ekleyeceğiz, bu şekilde kullanıcı herhangi bir şey 
  yazdığında olay eklenecek ve ardından Bloc sınıfının içindeki olay işleyici çağrılacak 
  ve daha sonra yeni bir durum ortaya çıkacak ve bu duruma göre kullanıcıya input altın
  da bir hata göstereceğiz.
*/ 