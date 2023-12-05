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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i7;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i9;
import '../../data/repos/home_repo/home_repo.dart' as _i11;
import '../../data/utils/shared_utils.dart' as _i5;
import '../../ui/screens/auth/login/login_view_model.dart' as _i13;
import '../../ui/screens/auth/register/register_view_model.dart' as _i15;
import '../../ui/screens/main/main_view_model.dart' as _i4;
import '../../ui/screens/main/tabs/home/home_view_model.dart' as _i21;
import '../../ui/shared_view_model/cart_view_model.dart' as _i22;
import '../repos/auth_repo/auth_repo.dart' as _i6;
import '../repos/home_repo/ds/home_online_ds.dart' as _i8;
import '../repos/home_repo/home_repo.dart' as _i10;
import '../use_cases/add_to_cart_user_case.dart' as _i17;
import '../use_cases/get_all_categories_use_case.dart' as _i18;
import '../use_cases/get_all_products_use_case.dart' as _i19;
import '../use_cases/get_logged_user_cart_use_case.dart' as _i20;
import '../use_cases/login_use_case.dart' as _i12;
import '../use_cases/register_use_case.dart' as _i14;
import '../use_cases/remove_frome_cart_user_case.dart' as _i16;
import 'app_module.dart' as _i23;

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
    gh.factory<_i4.MainViewModel>(() => _i4.MainViewModel());
    gh.factory<_i5.SharedPrefsUtils>(() => _i5.SharedPrefsUtils());
    gh.factory<_i6.AuthRepo>(() => _i7.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i5.SharedPrefsUtils>(),
        ));
    gh.factory<_i8.HomeOnlineDS>(
        () => _i9.HomeOnlineDSImpl(gh<_i5.SharedPrefsUtils>()));
    gh.factory<_i10.HomeRepo>(() => _i11.HomeRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i8.HomeOnlineDS>(),
        ));
    gh.factory<_i12.LoginUseCase>(() => _i12.LoginUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i13.LoginViewModel>(
        () => _i13.LoginViewModel(gh<_i12.LoginUseCase>()));
    gh.factory<_i14.RegisterUseCase>(
        () => _i14.RegisterUseCase(gh<_i6.AuthRepo>()));
    gh.factory<_i15.RegisterViewModel>(
        () => _i15.RegisterViewModel(gh<_i14.RegisterUseCase>()));
    gh.factory<_i16.RemoveFromCartUseCase>(
        () => _i16.RemoveFromCartUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i17.AddToCartUseCase>(
        () => _i17.AddToCartUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i18.GetAllCategoriesUseCase>(
        () => _i18.GetAllCategoriesUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i19.GetAllProductsUseCase>(
        () => _i19.GetAllProductsUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i20.GetLoggedUserCartUseCase>(
        () => _i20.GetLoggedUserCartUseCase(gh<_i10.HomeRepo>()));
    gh.factory<_i21.HomeViewModel>(() => _i21.HomeViewModel(
          gh<_i18.GetAllCategoriesUseCase>(),
          gh<_i19.GetAllProductsUseCase>(),
        ));
    gh.factory<_i22.CartViewModel>(() => _i22.CartViewModel(
          gh<_i20.GetLoggedUserCartUseCase>(),
          gh<_i17.AddToCartUseCase>(),
          gh<_i16.RemoveFromCartUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i23.AppModule {}
