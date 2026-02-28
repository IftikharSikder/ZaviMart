import 'package:bloc/bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_event.dart';
import 'package:zavi_bazaar/features/home/bloc/promotional_banner/promotional_banner_state.dart';

class PromotionalBannerBloc extends Bloc<PromotionalBannerEvent, PromotionalBannerState> {
  PromotionalBannerBloc() : super(InitialState()) {
    on<GetPromotionalBanner>(_fetchPromotionalBanner);
  }
  void _fetchPromotionalBanner(
    GetPromotionalBanner event,
    Emitter<PromotionalBannerState> emit,
  ) async {
    emit(LoadingState());
    try {
      await Future.delayed(Duration(seconds: 2), () {
        emit(LoadedState(imgPath: 'assets/images/promotional_banner.png'));
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
