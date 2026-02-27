import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final int? index;
  const NavigationState({this.index});

  NavigationState copyWith({int? index}) {
    return NavigationState(index: index);
  }

  @override
  List<Object?> get props => [index];
}
