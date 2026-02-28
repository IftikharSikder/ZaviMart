import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zavi_bazaar/app/config/api_client.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_event.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_state.dart';
import 'package:zavi_bazaar/features/home/data/models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ApiClient apiClient;
  ProductBloc({required this.apiClient}) : super(InitialState()) {
    on<FetchProduct>(_fetchProduct);
  }
  Future<void> _fetchProduct(FetchProduct event, Emitter<ProductState> emit) async {
    emit(LoadingState());
    try {
      final data = await apiClient.get(endPoint: AppConstants.products);
      List<ProductModel> products = [];
      for (var i in data) {
        products.add(ProductModel.fromJson(i));
      }
      emit(LoadedState(products: products));
      print(products);
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}
