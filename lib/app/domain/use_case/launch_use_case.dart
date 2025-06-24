import 'package:either_dart/either.dart';
import 'package:space_x/app/data/model/crew_model.dart';
import 'package:space_x/app/data/model/error_msg.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/data/model/rocket_Model.dart';
import 'package:space_x/app/domain/repository/launch_repo.dart';

class LaunchUseCase {
  final LaunchRepo launchRepo;
  LaunchUseCase(this.launchRepo);
  Future<Either<ErrorMsg, List<LaunchPadModel>>> getAllLaunchPads() async {
    final lauacnchData = await launchRepo.getAllLaunchPads();
    return lauacnchData;
  }

  Future<Either<ErrorMsg, List<LaunchesModel>>> getAllLaunches() async {
    final lauacnchData = await launchRepo.getAllLaunches();
    return lauacnchData;
  }

  Future<List<LaunchesModel>> sortLaunches(
    List<LaunchesModel>? launches, {
    bool sortByDate = true,
  }) async {
    final lauacnchData = await launchRepo.sortLaunches(
      launches,
      sortByDate: sortByDate,
    );
    return lauacnchData;
  }

  Future<Either<ErrorMsg, RocketModel>> getRocketDetail({
    required String id,
  }) async {
    final rocketData = await launchRepo.getRocketDetail(id: id);
    return rocketData;
  }

  Future<Either<ErrorMsg, List<CrewModel>>> getCrew({
    required List<String> id,
  }) async {
    final crewData = await launchRepo.getCrew(id: id);
    return crewData;
  }

  Future<Either<ErrorMsg, LaunchPadModel>> getOneLaunchPad({
    required String id,
  }) async {
    final rocketData = await launchRepo.getOneLaunchPad(id: id);
    return rocketData;
  }
}
