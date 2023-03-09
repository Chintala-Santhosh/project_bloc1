import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_bloc1/model/user_modal.dart';


@immutable
abstract class BaseState extends Equatable {
  const BaseState();
}

class Loading extends BaseState {
  @override
  List<Object?> get props => [];

}
class Loaded extends BaseState {
  Loaded(this.users);
  final List<UserModel2> users;

  @override
  List<Object?> get props => [users];

}
class Error extends BaseState {
  Error(this.error);
  final String error;

  @override
  List<Object?> get props => [error];

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


class DataLoaded<T> extends BaseState {
  T data;
  String event;

  DataLoaded({required this.data, required this.event});

  @override
  String toString() => 'DataLoaded';

  @override
  List<Object?> get props => [];
}


class BaseError extends BaseState {
  final String errorMessage;

  BaseError(this.errorMessage);

  @override
  String toString() => 'Error';

  @override
  List<Object> get props => [errorMessage];
}