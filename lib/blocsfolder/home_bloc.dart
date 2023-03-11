import 'package:flutter_bloc/flutter_bloc.dart';
import '../base_state.dart';
import '../home/home_events.dart';
import '../repo/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent,BaseState> {
  final HomeRepository _repository = HomeRepository();


  Init get initialState => Init();

  HomeBloc({required BaseState initialState}) :super(initialState) {
    on <GetUserDetails>(_onGetHomePageDetail);
    on <AddEmployeesDetails>(_onAddEmployeesDetails);
    on <UpdateEmployeesDetails>(_onUpdateEmployees);
    on <DeleteEmployeesDetails>(_onDeleteEmployeesDetails);
  }

  Future<void> _onGetHomePageDetail(event, Emitter<BaseState>emit) async {
    emit(Loading());
    print("GetUserDetails");
    try {
      final users = await _repository.getUsers();
      emit(DataLoaded(data: users, event: 'GetUserDetails',));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }


  Future<void> _onAddEmployeesDetails(event, Emitter<BaseState>emit) async {
    emit(Loading());
    print("AddEmployeesDetails");
    try {
      final updateUsersList = await _repository.addEmployeesDetails(event.request);
      emit(DataLoaded(data: updateUsersList, event: 'AddEmployeesDetails'));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
  Future<void> _onUpdateEmployees(event, Emitter<BaseState>emit) async {
    emit(Loading());
    print("UpdateEmployeesDetails");
    try {
      final updateUsersList = await _repository.updateEmployees(event.request);
      emit(DataLoaded(data: updateUsersList, event: 'UpdateEmployeesDetails'));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
  Future<void> _onDeleteEmployeesDetails(event, Emitter<BaseState>emit) async {
    emit(Loading());
    print("DeleteEmployeesDetails");
    try {
      final updateUsersList = await _repository.deleteEmployees();
      emit(DataLoaded(data: updateUsersList, event: 'DeleteEmployeesDetails'));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

}

