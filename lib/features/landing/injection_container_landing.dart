import 'package:get_it/get_it.dart';
import 'package:upskill_practices/features/landing/presentation/cubits/landing_cubit.dart';

final landingSl = GetIt.instance;

Future<void> init() async {
  landingSl.registerFactory(
    () => LandingCubit(),
  );
}
