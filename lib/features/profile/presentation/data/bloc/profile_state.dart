import 'package:equatable/equatable.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/model/profile_model.dart';

class ProfileState extends Equatable {
  final ProfileModel? profileInfo;
  const ProfileState({this.profileInfo});

  @override
  List<Object?> get props => [profileInfo];
}
