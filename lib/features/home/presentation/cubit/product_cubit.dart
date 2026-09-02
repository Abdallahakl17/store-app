import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

 import 'package:store_app/features/home/domain/use_case/get_products_usecase.dart';
 
import 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit(this.getProductsUseCase) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());

    final result = await getProductsUseCase();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.message));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }
}