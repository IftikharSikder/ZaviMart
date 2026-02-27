import 'package:bloc/bloc.dart';
import 'package:zavi_bazaar/app/config/api_client.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import 'package:zavi_bazaar/features/auth/presentation/bloc/sign_in/sign_in_state.dart';
import 'package:zavi_bazaar/features/auth/presentation/data/models/login_request_model.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final ApiClient apiClient;
  final Map<String, dynamic> signInData = {"username": "mor_2314", "password": "83r5^_"};
  SignInBloc({required this.apiClient}) : super(InitialState()) {
    on<ValidateUserEvent>(_validateUserEvent);
  }
  void _validateUserEvent(ValidateUserEvent event, Emitter<SignInState> emit) async {
    emit(LoadingState());

    try {
      final requestData = LoginRequestModel(
        username: signInData["username"],
        password: signInData["password"],
      ).toJson();
      final response = await apiClient.post(postBody: requestData, endPoint: AppConstants.login);
      if (response == null) {
        emit(SuccessState(statusCode: 201));
      } else {
        emit(ErrorState(errorMsg: response));
      }
    } catch (e) {
      emit(ErrorState(errorMsg: e.toString()));
    }
  }
}
