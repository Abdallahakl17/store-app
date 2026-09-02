import 'package:injectable/injectable.dart';
import 'package:store_app/core/network/api_end_points.dart';
import 'package:store_app/core/network/api_service.dart';
import 'package:store_app/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:store_app/features/wishlist/data/model/wishlist_model.dart';

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl
    implements WishlistRemoteDataSource {
  final ApiService apiService;

  WishlistRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<WishlistModel>> getWishlist() async {
    final response = await apiService.get(
      endPoint: ApiEndpoints.wishlist,
    );

    final List data = response.data['data'];

    return data
        .map((json) => WishlistModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> addToWishlist(String productId) async {
    await apiService.post(
      endPoint: ApiEndpoints.wishlist,
      data: {
        'productId': productId,
      },
    );
  }

  @override
  Future<void> removeFromWishlist(String productId) async {
     /// / to od remove
     /// 
  }
}