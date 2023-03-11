
import 'package:project_bloc1/model/updare_user_response_model.dart';
import 'package:project_bloc1/model/user_modal.dart';
import 'package:equatable/equatable.dart';
class BaseState extends Equatable {
  //abstract
  const BaseState();
  @override
  String toString() => 'BaseState';
  @override
  List<Object> get props => [];

}

class Loading extends BaseState {
  @override
  String toString() => 'Loading';

}

class Init extends BaseState {
  @override
  String toString() => 'Init';
}
class Loaded extends BaseState {
  Loaded(this.users);
  final List<UserModel2> users;
  @override
  String toString() => 'Loaded';

}
class Loaded1 extends BaseState {
   Loaded1(this.updateUsersList);
  final UpdateUserResponse updateUsersList;
  @override
  String toString() => 'Loaded1';

}
class DataLoaded<T> extends BaseState {
  T data;
  String event;

  DataLoaded({required this.data, required this.event});

  @override
  String toString() => 'DataLoaded';

}
class Error extends BaseState {
  Error(this.error);
  final String error;
  @override
  String toString() => 'Error';


}
// class BaseState extends Equatable {
//   @override
//   List<Object> get props => [];
// }
//
// class Loading extends BaseState {
//   @override
//   String toString() => 'Loading';
// }
// class Init extends BaseState {
//   @override
//   String toString() => 'Init';
// }




class BaseError extends BaseState {
  final String errorMessage;

  BaseError(this.errorMessage);

  @override
  String toString() => 'Error';

}