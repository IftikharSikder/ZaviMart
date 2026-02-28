import 'package:equatable/equatable.dart';

class PromotionalBannerState extends Equatable {
  final String? imgPath;
  const PromotionalBannerState({this.imgPath});

  @override
  List<Object?> get props => [imgPath];
}

class InitialState extends PromotionalBannerState {}

class LoadingState extends PromotionalBannerState {}

class LoadedState extends PromotionalBannerState {
  @override
  final String imgPath;
  const LoadedState({required this.imgPath}) : super(imgPath: imgPath);
}

class ErrorState extends PromotionalBannerState {}
