import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetHomePageDetail extends HomeEvent {
  @override
  List<Object?> get props => [];

}