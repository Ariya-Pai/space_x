part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  final String errorMsg;
  final List<LaunchPadModel>? launchPadModel;
  final List<LaunchesModel>? launchesModel;
  final RocketModel? rocketModel;
  final LaunchPadModel? oneLaunchpad;
  final LaunchesModel? oneLaunches;

  const HomeState({
    this.status = HomeStatus.initial,
    this.errorMsg = "",
    this.launchPadModel,
    this.launchesModel,
    this.rocketModel,
    this.oneLaunchpad,
    this.oneLaunches,
  });
  HomeState copyWith({
    HomeStatus? status,
    String? errorMsg,
    List<LaunchPadModel>? launchPadModel,
    List<LaunchesModel>? launchesModel,
    RocketModel? rocketModel,
    LaunchPadModel? oneLaunchpad,
    LaunchesModel? oneLaunches,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      launchPadModel: launchPadModel ?? this.launchPadModel,
      launchesModel: launchesModel ?? this.launchesModel,
      rocketModel: rocketModel ?? this.rocketModel,
      oneLaunchpad: oneLaunchpad ?? this.oneLaunchpad,
      oneLaunches: oneLaunches ?? this.oneLaunches,
    );
  }

  @override
  List<Object?> get props => [
    status,
    errorMsg,
    launchPadModel,
    launchesModel,
    rocketModel,
    oneLaunchpad,
    oneLaunches,
  ];
}

enum HomeStatus { initial, loading, loaded, error, success }
