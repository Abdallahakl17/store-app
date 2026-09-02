 
import 'package:store_app/features/home/data/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts(int page);
}