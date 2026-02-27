import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends SignInState {}

class LoadingState extends SignInState {}

class SuccessState extends SignInState {
  late final int? statusCode;
  SuccessState({this.statusCode});

  @override
  List<Object?> get props => [statusCode];
}

class ErrorState extends SignInState {
  final String? errorMsg;
  ErrorState({this.errorMsg});

  ErrorState copyWith({required String errorMsg}) {
    return ErrorState(errorMsg: errorMsg);
  }

  @override
  List<Object?> get props => [errorMsg];
}
