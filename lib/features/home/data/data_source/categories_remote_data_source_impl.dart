import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/home/data/data_source/categories_remote_data_source.dart';
import 'package:store_app/features/home/data/model/category_model.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl
    implements CategoriesRemoteDataSource {
  final ApiService apiService;

  const CategoriesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get(
    endPoint:    ApiEndpoints.categories, 
    );

    final List data = response.data['data'];

    return data
        .map(
          (category) => CategoryModel.fromJson(category),
        )
        .toList();
  }
}