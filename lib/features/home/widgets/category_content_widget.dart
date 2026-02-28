import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zavi_bazaar/core/constants/app_constants.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_bloc.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_event.dart';
import 'package:zavi_bazaar/features/home/bloc/product/product_state.dart';
import 'package:zavi_bazaar/features/home/data/models/product_model.dart';
import 'package:zavi_bazaar/features/home/widgets/product_card.dart';

class CategoryContentWidget extends StatefulWidget {
  final String label;
  final int categoryIndex;
  const CategoryContentWidget({super.key, required this.label, required this.categoryIndex});

  @override
  State<CategoryContentWidget> createState() => _CategoryContentWidgetState();
}

class _CategoryContentWidgetState extends State<CategoryContentWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductBloc>().add(FetchProduct());
        await Future.delayed(const Duration(milliseconds: 800));
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                final isLoading = state is LoadingState;

                final List<ProductModel> allProducts = state is LoadedState ? (state).products : [];
                final products = state is LoadedState
                    ? allProducts
                          .where(
                            (p) =>
                                p.category.toLowerCase() ==
                                AppConstants.categories[widget.categoryIndex].toLowerCase(),
                          )
                          .toList()
                    : List.filled(6, null);

                return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = state is LoadedState ? products[index] : null;

                    return Skeletonizer(
                      enabled: isLoading,
                      child: ProductCard(product: product),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
