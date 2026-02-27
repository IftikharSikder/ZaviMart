import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeNavigation extends NavigationEvent {
  final int index;
  ChangeNavigation({required this.index});
  @override
  List<Object?> get props => [index];
}
