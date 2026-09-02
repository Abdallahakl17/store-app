import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/features/home/domain/use_case/get_categories_use_case.dart';

 import 'package:store_app/features/home/presentation/cubit/categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoriesCubit(this.getCategoriesUseCase)
      : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());

    final result = await getCategoriesUseCase();

    result.fold(
      (failure) {
        emit(CategoriesFailure(failure.message));
      },
      (categories) {
        emit(CategoriesSuccess(categories));
      },
    );
  }
}