import 'package:dartz/dartz.dart';
import 'package:upskill_practices/core/base/base_failures.dart';
import 'package:upskill_practices/features/dashboard/database/datasource/dashboard_data_src.dart';
import 'package:upskill_practices/features/user_details/domain/usecases/fetch_user_data_case.dart';

import '../../domain/repositories/dashboard_repositories.dart';

class DashboardRepositoriesImpl extends DashboardRepositories {
  DashboardDataSrc dashboardDataSrc;

  DashboardRepositoriesImpl(this.dashboardDataSrc);

  /*@override
  Stream<Either<Failure, String>> fetchUserDetails(UserData params) async* {
    try {
      dashboardDataSrc.fetchUserDetails(params);
    } catch (e) {


    }
  }*/
}
