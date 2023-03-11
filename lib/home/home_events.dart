import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/employee_request_model.dart';
@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetUserDetails extends HomeEvent {
  @override
  List<Object?> get props => [];

}

class AddEmployeesDetails extends HomeEvent {
  final EmployeeRequestModel request;
  const AddEmployeesDetails({required this.request});
  @override
  List<Object?> get props => [request];

}
class UpdateEmployeesDetails extends HomeEvent {
  final EmployeeRequestModel request;
  const UpdateEmployeesDetails({required this.request});
  @override
  List<Object?> get props => [request];

}
class DeleteEmployeesDetails extends HomeEvent {
  const DeleteEmployeesDetails();
  @override
  List<Object?> get props => [];

}