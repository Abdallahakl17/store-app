class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl =
      'https://ecommerce.routemisr.com/api/v1/';

  // Auth
  static const String signup = 'auth/signup';
  static const String signin = 'auth/signin';
  static const String forgotPassword = 'auth/forgotPasswords';
  static const String verifyResetCode = 'auth/verifyResetCode';
  static const String resetPassword = 'auth/resetPassword';

  // Categories 
  static const String categories = 'categories';

  // Brands
  static const String brands = 'brands';

  // Products
  static const String products = 'products';

  // Cart
  static const String cart = 'cart';

  // Wishlist
  static const String wishlist = 'wishlist';

  // Orders
  static const String orders = 'orders';
}





// // core
// │
// ├── ApiService                @lazySingleton
// ├── TokenStorageService       @lazySingleton
// ├── AuthInterceptor           @lazySingleton
// │
// ├── NetworkModule             @module
// ├── StorageModule             @module
// │
// features
// │
// ├── AuthRemoteDataSourceImpl  @LazySingleton(as:)
// │
// ├── AuthRepositoryImpl        @LazySingleton(as:)
// │
// ├── SignupUseCase            @lazySingleton
// │
// └── SignupCubit              @injectable