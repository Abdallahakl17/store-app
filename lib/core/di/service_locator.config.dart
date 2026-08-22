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

import '../../features/auth/reset_password/data/data_sources/forgot_password_remote_data_source.dart'
    as _i904;
import '../../features/auth/reset_password/data/data_sources/forgot_password_remote_data_source_impl.dart'
    as _i620;
import '../../features/auth/reset_password/data/repository/sign_inrepository_impl.dart'
    as _i250;
import '../../features/auth/reset_password/domain/repositories/forgot_password_repository.dart'
    as _i856;
import '../../features/auth/reset_password/domain/use_cases/forgot_password_use_case.dart'
    as _i732;
import '../../features/auth/reset_password/presentation/cubit/forgot_password_cubit.dart'
    as _i446;
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
    gh.lazySingleton<_i820.SignInRemoteDataSource>(
        () => _i1002.SignInRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i897.SignUpRemoteDataSource>(
        () => _i807.SignUpRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i904.ForgotPasswordRemoteDataSource>(
        () => _i620.ForgotPasswordRemoteDataSourceImpl(gh<_i921.ApiService>()));
    gh.lazySingleton<_i17.SignInRepository>(() => _i91.SignInRepositoryImpl(
          gh<_i820.SignInRemoteDataSource>(),
          gh<_i474.TokenStorageService>(),
        ));
    gh.lazySingleton<_i812.SignUpRepository>(() => _i442.SignUpRepositoryImpl(
          gh<_i897.SignUpRemoteDataSource>(),
          gh<_i474.TokenStorageService>(),
        ));
    gh.lazySingleton<_i856.ForgotPasswordRepository>(() =>
        _i250.ForgotPasswordRepositoryImpl(
            gh<_i904.ForgotPasswordRemoteDataSource>()));
    gh.factory<_i854.SignupUseCase>(
        () => _i854.SignupUseCase(gh<_i812.SignUpRepository>()));
    gh.factory<_i705.SignInUseCase>(
        () => _i705.SignInUseCase(gh<_i17.SignInRepository>()));
    gh.lazySingleton<_i732.ForgotPasswordUseCase>(() =>
        _i732.ForgotPasswordUseCase(gh<_i856.ForgotPasswordRepository>()));
    gh.factory<_i1026.SignInCubit>(
        () => _i1026.SignInCubit(gh<_i705.SignInUseCase>()));
    gh.factory<_i490.SignupCubit>(
        () => _i490.SignupCubit(gh<_i854.SignupUseCase>()));
    gh.factory<_i446.ForgotPasswordCubit>(
        () => _i446.ForgotPasswordCubit(gh<_i732.ForgotPasswordUseCase>()));
    return this;
  }
}

class _$NetworkModule extends _i567.NetworkModule {}

class _$StorageModule extends _i371.StorageModule {}
