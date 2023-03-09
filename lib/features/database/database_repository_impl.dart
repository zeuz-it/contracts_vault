import '../models/user_model.dart';

import 'database_service.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  Future<void> saveUserData(UserModel user) {
    return service.addUserData(user);
  }

  @override
  Future<List<UserModel>> retrieveUserData() {
    return service.retrieveUserData();
  }
}

abstract class DatabaseRepository {
  Future<void> saveUserData(UserModel user);
  Future<List<UserModel>> retrieveUserData();
}
/* 
  Burada, verileri Firestore'a eklemek için saveUserData() ve verileri veritabanından 
  almak için retrieveUserData() olmak üzere iki yöntemimiz vardır.
*/ 