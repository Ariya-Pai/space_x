import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/data/model/lauchpad.dart';
import 'package:space_x/app/data/model/launches_model.dart';
import 'package:space_x/app/data/model/rocket_Model.dart';
import 'package:space_x/app/domain/use_case/launch_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LaunchUseCase launchUseCase;
  HomeBloc(this.launchUseCase) : super(const HomeState()) {
    on<GetAllLaunchPads>(onGetAllLaunch);
    on<GetAllLaunches>(onGetAllLaunches);
    on<SortDataLaunches>(onSortLaunches);
    on<GetOneCrew>(onGetOneCrew);
    on<GetRocketDetail>(onRocketDetail);
    on<GetOneLaunchPad>(onOneLaunchPad);
    on<SaveOneLaunches>(onSaveOneLaunches);
  }
  Future<void> onGetOneCrew(GetOneCrew event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    // final response = await launchUseCase.getAllLaunchPads();
    // response.fold(
    //   (left) {
    //     emit(state.copyWith(status: HomeStatus.error, errorMsg: left.message));
    //   },
    //   (right) {
    //     emit(state.copyWith(status: HomeStatus.success, launchPadModel: right));
    //   },
    // );
  }

  Future<void> onSaveOneLaunches(
    SaveOneLaunches event,
    Emitter<HomeState> emit,
  ) async {
    log("evet ${event.data.toJson()}");
    emit(state.copyWith(oneLaunches: event.data));
  }

  Future<void> onRocketDetail(
    GetRocketDetail event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    log("sadsadsasdsdasdsd");
    final response = await launchUseCase.getRocketDetail(id: event.id);
    response.fold(
      (left) {
        emit(state.copyWith(status: HomeStatus.error, errorMsg: left.message));
      },
      (right) {
        emit(state.copyWith(status: HomeStatus.success, rocketModel: right));
      },
    );
  }

  Future<void> onOneLaunchPad(
    GetOneLaunchPad event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await launchUseCase.getOneLaunchPad(id: event.id);
    response.fold(
      (left) {
        emit(state.copyWith(status: HomeStatus.error, errorMsg: left.message));
      },
      (right) {
        emit(state.copyWith(status: HomeStatus.success, oneLaunchpad: right));
      },
    );
  }

  Future<void> onGetAllLaunch(
    GetAllLaunchPads event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await launchUseCase.getAllLaunchPads();
    response.fold(
      (left) {
        emit(state.copyWith(status: HomeStatus.error, errorMsg: left.message));
      },
      (right) {
        emit(state.copyWith(status: HomeStatus.success, launchPadModel: right));
      },
    );
  }

  Future<void> onGetAllLaunches(
    GetAllLaunches event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await launchUseCase.getAllLaunches();
    response.fold(
      (left) {
        emit(state.copyWith(status: HomeStatus.error, errorMsg: left.message));
      },
      (right) {
        emit(state.copyWith(status: HomeStatus.success, launchesModel: right));
      },
    );
  }

  Future<void> onSortLaunches(
    SortDataLaunches event,
    Emitter<HomeState> emit,
  ) async {
    final response = await launchUseCase.sortLaunches(
      event.data ?? [],
      sortByDate: event.sortByDate ?? false,
    );

    emit(state.copyWith(launchesModel: response, status: HomeStatus.success));
  }
}
