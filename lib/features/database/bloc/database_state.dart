part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();
  
  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseSuccess extends DatabaseState {
  final List<UserModel> listOfUserData;
  const DatabaseSuccess(this.listOfUserData);

    @override
  List<Object?> get props => [listOfUserData];
}

class DatabaseError extends DatabaseState {
      @override
  List<Object?> get props => [];
}
/* 
  Burada 3 durumumuz var: DatabaseInitial(başlangıç durumu), verileri içerecek olan 
  DatabaseSuccess(başarı durumu) ve DatabaseError(hata durumu).
*/ 