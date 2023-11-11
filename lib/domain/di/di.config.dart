// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i6;
import '../../data/utils/shared_utils.dart' as _i4;
import '../../ui/screens/auth/login/login_view_model.dart' as _i8;
import '../../ui/screens/auth/register/register_view_model.dart' as _i10;
import '../repos/auth_repo/auth_repo.dart' as _i5;
import '../use_cases/login_use_case.dart' as _i7;
import '../use_cases/register_use_case.dart' as _i9;
import 'app_module.dart' as _i11;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i4.SharedPrefsUtils>(() => _i4.SharedPrefsUtils());
    gh.factory<_i5.AuthRepo>(() => _i6.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i4.SharedPrefsUtils>(),
        ));
    gh.factory<_i7.LoginUseCase>(() => _i7.LoginUseCase(gh<_i5.AuthRepo>()));
    gh.factory<_i8.LoginViewModel>(
        () => _i8.LoginViewModel(gh<_i7.LoginUseCase>()));
    gh.factory<_i9.RegisterUseCase>(
        () => _i9.RegisterUseCase(gh<_i5.AuthRepo>()));
    gh.factory<_i10.RegisterViewModel>(
        () => _i10.RegisterViewModel(gh<_i9.RegisterUseCase>()));
    return this;
  }
}

class _$AppModule extends _i11.AppModule {}
