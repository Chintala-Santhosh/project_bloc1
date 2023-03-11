import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/update_user_request_model.dart';
@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetUserDetails extends HomeEvent {
  @override
  List<Object?> get props => [];

}

class UpdateUserDetails extends HomeEvent {
  final UpdateUserRequest request;
   const UpdateUserDetails({required this.request});
  @override
  List<Object?> get props => [request];

}
class AddEmployeesDetails extends HomeEvent {
  final UpdateUserRequest request;
  const AddEmployeesDetails({required this.request});
  @override
  List<Object?> get props => [request];

}