import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:store_app/core/error/failures/failures.dart';
  import 'package:store_app/features/home/domain/entity/category_entity.dart';
import 'package:store_app/features/home/domain/repositories/categories_repository.dart';
@injectable

class GetCategoriesUseCase {
  final CategoriesRepository repository;

  const GetCategoriesUseCase(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}