import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? email;
  String? password;
  String? passwordAgain;
  UserModel({this.uid, this.email, this.password, this.passwordAgain, this.isVerified});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"];

  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? password,
    String? passwordAgain,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordAgain: passwordAgain ?? this.passwordAgain,
        isVerified: isVerified ?? this.isVerified);
  }
}
/* 
  Burada, verileri veritabanına kaydetmek için kullanılacak bir toMap() yöntemi ve 
  alınan verileri UserModel sınıfıyla eşlemek için fromDocumentSnapshot() yöntemi 
  oluşturuyoruz. Ayrıca belirli alanları güncellemek ve güncellenmiş alanlara sahip 
  bir örnek döndürmek için copyWith() yöntemini kullanıyoruz.
*/
