import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:space_x/app/data/data_sources/launchpad_source.dart';
import 'package:space_x/app/data/model/crew_model.dart';
import 'package:space_x/app/data/model/error_msg.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/data/model/rocket_Model.dart';
import 'package:space_x/app/domain/repository/launch_repo.dart';
import 'package:space_x/core/remote/handle_dio_exception.dart';

class LaunchpadRepoImpl implements LaunchRepo {
  final LaunchpadSource launchpadSource;
  LaunchpadRepoImpl(this.launchpadSource);

  @override
  Future<Either<ErrorMsg, List<LaunchPadModel>>> getAllLaunchPads() async {
    try {
      final launchData = await launchpadSource.getAllLaunchPads();
      return Right(launchData);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, List<LaunchesModel>>> getAllLaunches() async {
    try {
      final launchData = await launchpadSource.getAllLaunches();
      return Right(launchData);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<List<LaunchesModel>> sortLaunches(
    List<LaunchesModel>? launch, {
    bool? sortByDate,
  }) async {
    try {
      final launchData = await launchpadSource.sortLaunches(
        launch,
        sortByDate: sortByDate ?? false,
      );
      return launchData;
    } on DioException catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
      return [];
    }
  }

  @override
  Future<Either<ErrorMsg, RocketModel>> getRocketDetail({
    String id = "",
  }) async {
    try {
      final launchData = await launchpadSource.getRocketDetail(id: id);
      return Right(launchData);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, List<CrewModel>>> getCrew({List<String>? id}) async {
    try {
      final crewData = await launchpadSource.getCrew(id: id);
      return Right(crewData);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }

  @override
  Future<Either<ErrorMsg, LaunchPadModel>> getOneLaunchPad({
    String id = "",
  }) async {
    try {
      final launchData = await launchpadSource.getOneLaunchPad(id: id);
      return Right(launchData);
    } on DioException catch (e) {
      return Left(e.toAppError());
    }
  }
}
