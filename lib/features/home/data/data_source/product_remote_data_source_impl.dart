import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/home/data/data_source/product_remote_data_source.dart';
import 'package:store_app/features/home/data/model/product_model.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.products,
    );

    final List data = response.data['data'];

    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
