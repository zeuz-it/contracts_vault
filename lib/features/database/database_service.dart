import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contract_model.dart';
import '../models/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  addUserData(UserModel userData) async {
    await _db.collection("Users").doc(userData.uid).set(userData.toMap());
  }

  Future<List<UserModel>> retrieveUserData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Users").get();
    return snapshot.docs
        .map((docSnapshot) => UserModel.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}
/* 
  İlk olarak, bir Firestore örneği(instance) alıyoruz ve ardından addUserData() içinde 
  Users adında bir koleksiyon oluşturuyoruz ve ardından userId'yi bir belge kimliği 
  olarak atıyoruz ve userData'yı belgenin altına eklemek için set() yöntemini 
  kullanıyoruz.

  retrieveUserData() metodunda, Users koleksiyonu içindeki tüm belgeleri almak için 
  get() metodunu kullanırız ve ardından tüm verileri içerecek UserModel türünde bir 
  liste döndürmek için map kullanırız. 
*/ 