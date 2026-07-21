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

import '../network/api_service.dart' as _i299;
import '../network/auth_interceptor.dart' as _i577;
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
    gh.lazySingleton<_i577.AuthInterceptor>(
        () => _i577.AuthInterceptor(gh<_i474.TokenStorageService>()));
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio(
          gh<_i577.AuthInterceptor>(),
          gh<_i162.TalkerDioLogger>(),
        ));
    gh.lazySingleton<_i299.ApiService>(() => _i299.ApiService(gh<_i361.Dio>()));
    return this;
  }
}

class _$NetworkModule extends _i567.NetworkModule {}

class _$StorageModule extends _i371.StorageModule {}
