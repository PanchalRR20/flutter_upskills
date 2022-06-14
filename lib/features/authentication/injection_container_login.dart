import 'package:get_it/get_it.dart';
import 'package:upskill_practices/features/authentication/presentation/cubits/login_cubit.dart';

import 'data/datasource/login_data_source.dart';
import 'data/datasource/login_data_source_impl.dart';
import 'data/repositories/login_repositories_impl.dart';
import 'domain/repositories/login_repositories.dart';
import 'domain/usecases/login_case.dart';

final loginSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  loginSl.registerFactory(
    () => LoginCubit(loginCase: loginSl()),
  );

  // Use Cases
  loginSl.registerLazySingleton(() => LoginCase(loginSl()));

  // Repository
  loginSl.registerLazySingleton<LoginRepositories>(() => LoginRepositoriesImpl(loginSl()));

  // Data sources
  loginSl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(),
  );
}
