import 'package:equatable/equatable.dart';
import 'package:zavi_bazaar/features/home/data/models/product_model.dart';

class ProductState extends Equatable {
  final List<ProductModel> product;
  const ProductState({this.product = const []});

  @override
  List<Object?> get props => [product];
}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedState extends ProductState {
  final List<ProductModel> products;
  const LoadedState({required this.products}) : super(product: products);
}

class ErrorState extends ProductState {
  final String message;
  const ErrorState({required this.message});
}
