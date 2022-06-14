import 'package:get_it/get_it.dart';
import 'package:upskill_practices/features/user_details/data/repositories/user_details_respositores_impl.dart';
import 'package:upskill_practices/features/user_details/domain/usecases/fetch_user_list_data_case.dart';
import 'package:upskill_practices/features/user_details/presentation/cubit/user_details_cubit.dart';

import 'data/datasource/user_details_local_src.dart';
import 'data/datasource/user_details_local_src_impl.dart';
import 'domain/repositories/user_details_repositories.dart';

final adminSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  adminSl.registerFactory(
    () => UserDetailCubit(fetchUserListDataCase: adminSl()),
  );

  // Use Cases
  adminSl.registerLazySingleton(() => FetchUserListDataCase(adminSl()));

  // Repository
  adminSl.registerLazySingleton<UserDetailsRepositories>(
      () => UserDetailsRepositoriesImpl(adminSl()));

  // Data sources
  adminSl.registerLazySingleton<UserDetailsLocalSrc>(
    () => UserDetailsLocalSrcImpl(),
  );
}
