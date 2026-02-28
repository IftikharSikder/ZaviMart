import 'package:bloc/bloc.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_event.dart';
import 'package:zavi_bazaar/features/dashboard/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0)) {
    on<ChangeNavigation>(_changeNavigation);
  }
  void _changeNavigation(ChangeNavigation event, Emitter<NavigationState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
