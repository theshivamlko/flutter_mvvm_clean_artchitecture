import 'package:dio/dio.dart';
import 'package:flutter_mvvm_clean_artchitecture/app/app_pref.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/data_source/remote_data_source.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/app_api.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/dio_factory.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/network/network_info.dart';
import 'package:flutter_mvvm_clean_artchitecture/data/repository/repository_impl.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/repository.dart';
import 'package:flutter_mvvm_clean_artchitecture/domain/usecase/login_usecase.dart';
import 'package:flutter_mvvm_clean_artchitecture/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPref = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(instance()));

  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance<AppPreference>()));

  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnection.createInstance()));

  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // Creates new instance every time
    instance
        .registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

    instance.registerFactory<LoginViewModel>(
        () => LoginViewModel(instance()));
  }
}
