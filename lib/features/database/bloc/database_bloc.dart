import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

import '../database_repository_impl.dart';


part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final DatabaseRepository _databaseRepository;
  DatabaseBloc(this._databaseRepository) : super(DatabaseInitial()) {
    on<DatabaseFetched>(_fetchUserData);
  }

  _fetchUserData(DatabaseFetched event, Emitter<DatabaseState> emit) async {
      List<UserModel> listofUserData = await _databaseRepository.retrieveUserData();
      emit(DatabaseSuccess(listofUserData));
  }
}
/* 
  Burada, DatabaseFetched olayı tetiklenirse, _fetchUserData() yöntemini çağıracak, 
  bu da retrieveUserData() yöntemini çağıracak ve yanıtı aldıktan sonra Cloud 
  Firestore'dan aldığı verilerle yeni bir durum(state) yayacaktır(emit).
*/  