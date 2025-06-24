import 'package:space_x/app/data/model/error_msg.dart';
import 'package:either_dart/either.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/data/model/rocket_Model.dart';

abstract class LaunchRepo {
  Future<Either<ErrorMsg, List<LaunchPadModel>>> getAllLaunchPads();
  Future<Either<ErrorMsg, List<LaunchesModel>>> getAllLaunches();
  Future<List<LaunchesModel>> sortLaunches(
    List<LaunchesModel>? launch, {
    bool sortByDate,
  });
  Future<Either<ErrorMsg, RocketModel>> getRocketDetail({String id});
  Future<Either<ErrorMsg, LaunchPadModel>> getOneLaunchPad({String id});
}
