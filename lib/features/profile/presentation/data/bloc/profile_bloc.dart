import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/bloc/profile_event.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/bloc/profile_state.dart';
import 'package:zavi_bazaar/features/profile/presentation/data/model/profile_model.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<FetchProfileInfo>(_fetchProfileInfo);
  }
  _fetchProfileInfo(FetchProfileInfo event, Emitter<ProfileState> emit) async {
    try {
      final response = await rootBundle.loadString(
        "lib/features/profile/presentation/data/datasource/profile_dummy_data.json",
      );
      ProfileModel profileInfo;
      profileInfo = ProfileModel.fromJson(jsonDecode(response));
      emit(ProfileState(profileInfo: profileInfo));
    } catch (e) {
      throw Exception(e);
    }
  }
}
