// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart' as _i162;

import '../../features/auth/forgot_password/data/data_sources/forgot_password_remote_data_source.dart'
    as _i901;
import '../../features/auth/forgot_password/data/data_sources/forgot_password_remote_data_source_impl.dart'
    as _i711;
import '../../features/auth/forgot_password/data/repository/forgot_repository_impl.dart'
    as _i989;
import '../../features/auth/forgot_password/domain/repositories/forgot_password_repository.dart'
    as _i284;
import '../../features/auth/forgot_password/domain/use_cases/forgot_password_use_case.dart'
    as _i965;
import '../../features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart'
    as _i846;
import '../../features/auth/reset_password/data/data_sorce/reset_password_remote_data_source.dart'
    as _i53;
import '../../features/auth/reset_password/data/data_sorce/reset_password_remote_data_source_impl.dart'
    as _i57;
import '../../features/auth/reset_password/data/repositories/reset_password_repository_imp.dart'
    as _i436;
import '../../features/auth/reset_password/domain/repositories/rest_password_repository.dart'
    as _i729;
import '../../features/auth/reset_password/domain/use_case/rest_password_use_case.dart'
    as _i224;
import '../../features/auth/reset_password/presentation/cubit/reset_password_cubit.dart'
    as _i538;
import '../../features/auth/sign_in/data/data_source/sign_in_remote_data_source.dart'
    as _i820;
import '../../features/auth/sign_in/data/data_source/sign_in_remote_data_source_impl.dart'
    as _i1002;
import '../../features/auth/sign_in/data/repository/sign_inrepository_impl.dart'
    as _i91;
import '../../features/auth/sign_in/domain/repository/sign_in_repository.dart'
    as _i17;
import '../../features/auth/sign_in/domain/usecase/signin_use_cae.dart'
    as _i705;
import '../../features/auth/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i1026;
import '../../features/auth/sign_up/data/data_sources/sign_up_remote_data_source.dart'
    as _i897;
import '../../features/auth/sign_up/data/data_sources/sign_up_remote_data_source_impl.dart'
    as _i807;
import '../../features/auth/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i442;
import '../../features/auth/sign_up/domain/repositories/sign_up_repository.dart'
    as _i812;
import '../../features/auth/sign_up/domain/usecases/signup_use_case.dart'
    as _i854;
import '../../features/auth/sign_up/presentation/cubit/signup_cubit.dart'
    as _i490;
import '../../features/auth/verify_code/data/data_sources/verify_reset_code_remote_data_source.dart'
    as _i169;
import '../../features/auth/verify_code/data/data_sources/verify_reset_code_remote_data_source_impl.dart'
    as _i289;
import '../../features/auth/verify_code/data/repositories/verify_reset_code_repository_impl.dart'
    as _i689;
import '../../features/auth/verify_code/domain/repositories/verify_reset_code_repository.dart'
    as _i131;
import '../../features/auth/verify_code/domain/use_cases/verify_reset_code_use_case.dart'
    as _i647;
import '../../features/auth/verify_code/presentation/cubit/verify_reset_code_cubit.dart'
    as _i482;
import '../../features/home/data/data_source/categories_remote_data_source.dart'
    as _i6;
import '../../features/home/data/data_source/categories_remote_data_source_impl.dart'
    as _i895;
import '../../features/home/data/data_source/product_remote_data_source.dart'
    as _i87;
import '../../features/home/data/data_source/product_remote_data_source_impl.dart'
    as _i1070;
import '../../features/home/data/repositories/categories_repository_impl.dart'
    as _i299;
import '../../features/home/data/repositories/product_repository_impl.dart'
    as _i1065;
import '../../features/home/domain/repositories/categories_repository.dart'
    as _i722;
import '../../features/home/domain/repositories/product_repository.dart'
    as _i168;
import '../../features/home/domain/use_case/get_categories_use_case.dart'
    as _i215;
import '../../features/home/domain/use_case/get_products_usecase.dart' as _i111;
import '../../features/home/presentation/cubit/categories_cubit.dart' as _i820;
import '../../features/home/presentation/cubit/product_cubit.dart' as _i1053;
import '../network/api_service.dart' as _i921;
import '../network/auth_interceptor.dart' as _i908;
import '../services/token_storage_service.dart' as _i474;
import 'network_module.dart' as _i567;
import 'storage_module.dart' as _i371;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final storageModule = _$StorageModule();
    gh.lazySingleton<_i162.TalkerDioLogger>(() => networkModule.logger());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => storageModule.secureStorage);
    gh.lazySingleton<_i474.TokenStorageService>(
        () => _i474.TokenStorageService(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i908.AuthInterceptor>(
        () => _i908.AuthInterceptor(gh<_i474.TokenStorageService>()));
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(
          gh<_i908.AuthInterceptor>(),
          gh<_i162.TalkerDioLogger>(),
        ));
    gh.lazySingleton<_i921.ApiService>(() => _i921.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i53.ResetPasswordRemoteDataSource>(
        () => _i57.ResetPasswordRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i901.ForgotPasswordRemoteDataSource>(
        () => _i711.ForgotPasswordRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i284.ForgotPasswordRepository>(() =>
        _i989.ForgotPasswordRepositoryImpl(
            gh<_i901.ForgotPasswordRemoteDataSource>()));
    gh.lazySingleton<_i169.VerifyResetCodeRemoteDataSource>(() =>
        _i289.VerifyResetCodeRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i820.SignInRemoteDataSource>(
        () => _i1002.SignInRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i87.ProductRemoteDataSource>(
        () => _i1070.ProductRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i6.CategoriesRemoteDataSource>(
        () => _i895.CategoriesRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i897.SignUpRemoteDataSource>(
        () => _i807.SignUpRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i729.ResetPasswordRepository>(
        () => _i436.ResetPasswordRepositoryImpl(
              gh<_i53.ResetPasswordRemoteDataSource>(),
              gh<_i474.TokenStorageService>(),
            ));
    gh.factory<_i224.ResetPasswordUseCase>(
        () => _i224.ResetPasswordUseCase(gh<_i729.ResetPasswordRepository>()));
    gh.lazySingleton<_i17.SignInRepository>(() => _i91.SignInRepositoryImpl(
          gh<_i820.SignInRemoteDataSource>(),
          gh<_i474.TokenStorageService>(),
        ));
    gh.lazySingleton<_i812.SignUpRepository>(() => _i442.SignUpRepositoryImpl(
          gh<_i897.SignUpRemoteDataSource>(),
          gh<_i474.TokenStorageService>(),
        ));
    gh.lazySingleton<_i131.VerifyResetCodeRepository>(() =>
        _i689.VerifyResetCodeRepositoryImpl(
            gh<_i169.VerifyResetCodeRemoteDataSource>()));
    gh.lazySingleton<_i965.ForgotPasswordUseCase>(() =>
        _i965.ForgotPasswordUseCase(gh<_i284.ForgotPasswordRepository>()));
    gh.lazySingleton<_i722.CategoriesRepository>(() =>
        _i299.CategoriesRepositoryImpl(gh<_i6.CategoriesRemoteDataSource>()));
    gh.lazySingleton<_i168.ProductRepository>(
        () => _i1065.ProductRepositoryImpl(gh<_i87.ProductRemoteDataSource>()));
    gh.factory<_i538.ResetPasswordCubit>(
        () => _i538.ResetPasswordCubit(gh<_i224.ResetPasswordUseCase>()));
    gh.factory<_i854.SignupUseCase>(
        () => _i854.SignupUseCase(gh<_i812.SignUpRepository>()));
    gh.factory<_i215.GetCategoriesUseCase>(
        () => _i215.GetCategoriesUseCase(gh<_i722.CategoriesRepository>()));
    gh.factory<_i705.SignInUseCase>(
        () => _i705.SignInUseCase(gh<_i17.SignInRepository>()));
    gh.lazySingleton<_i111.GetProductsUseCase>(
        () => _i111.GetProductsUseCase(gh<_i168.ProductRepository>()));
    gh.factory<_i846.ForgotPasswordCubit>(
        () => _i846.ForgotPasswordCubit(gh<_i965.ForgotPasswordUseCase>()));
    gh.factory<_i647.VerifyResetCodeUseCase>(() =>
        _i647.VerifyResetCodeUseCase(gh<_i131.VerifyResetCodeRepository>()));
    gh.factory<_i1026.SignInCubit>(
        () => _i1026.SignInCubit(gh<_i705.SignInUseCase>()));
    gh.factory<_i820.CategoriesCubit>(
        () => _i820.CategoriesCubit(gh<_i215.GetCategoriesUseCase>()));
    gh.factory<_i490.SignupCubit>(
        () => _i490.SignupCubit(gh<_i854.SignupUseCase>()));
    gh.factory<_i1053.ProductCubit>(
        () => _i1053.ProductCubit(gh<_i111.GetProductsUseCase>()));
    gh.factory<_i482.VerifyResetCodeCubit>(
        () => _i482.VerifyResetCodeCubit(gh<_i647.VerifyResetCodeUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i567.NetworkModule {}

class _$StorageModule extends _i371.StorageModule {}
