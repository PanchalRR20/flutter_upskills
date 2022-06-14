import 'package:get_it/get_it.dart';
import 'package:upskill_practices/features/dashboard/database/datasource/dashboard_data_src.dart';
import 'package:upskill_practices/features/dashboard/database/datasource/dashboard_data_src_impl.dart';
import 'package:upskill_practices/features/dashboard/database/repositories/dashboard_repositories_impl.dart';
import 'package:upskill_practices/features/dashboard/domain/repositories/dashboard_repositories.dart';
import 'package:upskill_practices/features/user_details/domain/usecases/fetch_user_data_case.dart';
import 'package:upskill_practices/features/dashboard/presentation/cubit/dashboard_cubit.dart';

final dashboardSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  dashboardSl.registerFactory(() => DashboardCubit());

  // Use Cases
  dashboardSl.registerLazySingleton(() => FetchUserDataCase(dashboardSl()));

  // Repository
  dashboardSl.registerLazySingleton<DashboardRepositories>(() => DashboardRepositoriesImpl(dashboardSl()));

  // Data sources
  dashboardSl.registerLazySingleton<DashboardDataSrc>(() => DashboardDataSrcImpl());
}
