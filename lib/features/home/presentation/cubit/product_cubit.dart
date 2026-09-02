import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/features/home/domain/entity/Product_entity.dart';

 import 'package:store_app/features/home/domain/use_case/get_products_usecase.dart';

import 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit(this.getProductsUseCase) : super(ProductInitial()) {
    scrollController.addListener(_onScroll);
  }

  final ScrollController scrollController = ScrollController();

  final List<ProductEntity> products = [];

  int page = 1;

  bool hasMore = true;

  bool isLoading = false;

  void _onScroll() {
    if (isLoading || !hasMore) return;

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      loadMore();
    }
  }

  Future<void> getProducts() async {
    if (isLoading) return;

    isLoading = true;

    emit(ProductLoading());

    page = 1;
    products.clear();
    hasMore = true;

    final result = await getProductsUseCase(page);

    result.fold(
      (failure) {
        isLoading = false;

        emit(ProductFailure(failure.message));
      },
      (newProducts) {
        products.addAll(newProducts);

         hasMore = newProducts.length == 40;

        isLoading = false;

        emit(ProductSuccess(List.from(products)));

        page++;
      },
    );
  }

  Future<void> loadMore() async {
    if (isLoading || !hasMore) return;

    isLoading = true;

    emit(ProductPaginationLoading(List.from(products)));

    final result = await getProductsUseCase(page);

    result.fold(
      (failure) {
        isLoading = false;

        emit(ProductFailure(failure.message));
      },
      (newProducts) {
        products.addAll(newProducts);

        hasMore = newProducts.length == 40;

        page++;

        isLoading = false;

        emit(ProductSuccess(List.from(products)));
      },
    );
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}