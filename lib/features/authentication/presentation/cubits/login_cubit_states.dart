import 'package:equatable/equatable.dart';

abstract class LoginCubitState extends Equatable {
  const LoginCubitState();
}

class StateInitial extends LoginCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StateProgressLoading extends LoginCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginCubitState {
  String msg = '';

  @override
  List<Object?> get props => [msg];

  LoginSuccessState(this.msg);
}

class LogOutState extends LoginCubitState {
  String msg = '';

  @override
  List<Object?> get props => [msg];

  LogOutState(this.msg);
}
class LoginStateError extends LoginCubitState {
  String msg = '';

  @override
  List<Object?> get props => [msg];

  LoginStateError(this.msg);
}
