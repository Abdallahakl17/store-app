import 'package:dartz/dartz.dart';
import 'package:store_app/core/error/failures/failures.dart';
 import 'package:store_app/features/home/domain/entity/category_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}