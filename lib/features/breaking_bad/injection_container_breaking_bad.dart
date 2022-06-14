import 'package:get_it/get_it.dart';
import 'package:upskill_practices/features/breaking_bad/data/datasource/breaking_bad_local_src.dart';
import 'package:upskill_practices/features/breaking_bad/data/datasource/breaking_bad_local_src_impl.dart';
import 'package:upskill_practices/features/breaking_bad/data/repositories/breaking_bad_repositories_impl.dart';
import 'package:upskill_practices/features/breaking_bad/domain/repositories/breaking_bad_repositories.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/character_details_case.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/get_episodes_case.dart';
import 'package:upskill_practices/features/breaking_bad/domain/usecases/get_series_list_case.dart';
import 'package:upskill_practices/features/breaking_bad/presentation/cubits/breaking_bad_cubit.dart';

final badSl = GetIt.instance;

Future<void> init() async {
  /*
  * Members
  * */
  badSl.registerFactory(
    () => BreakingBadCubit(
        getSeriesListCase: badSl(),
        episodesCase: badSl(),
        characterDetailsCase: badSl()),
  );

  // Use Cases
  badSl.registerLazySingleton(() => GetSeriesListCase(badSl()));
  badSl.registerLazySingleton(() => GetEpisodesCase(badSl()));
  badSl.registerLazySingleton(() => GetCharacterDetailsCase(badSl()));

  // Repository
  badSl.registerLazySingleton<BreakingBadRepositories>(
      () => BreakingBadRepositoriesImpl(badSl()));

  // Data sources
  badSl.registerLazySingleton<BreakingBadLocalSrc>(
    () => BreakingBadLocalSrcImpl(),
  );
}
