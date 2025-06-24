part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

final class HomeInitialEvent extends HomeEvent {
  const HomeInitialEvent();
}

class GetAllLaunchPads extends HomeEvent {
  const GetAllLaunchPads();
}

class GetAllLaunches extends HomeEvent {
  const GetAllLaunches();
}

class GetRocketDetail extends HomeEvent {
  final String id;
  const GetRocketDetail({required this.id});
}

class GetOneCrew extends HomeEvent {
  final String id;
  const GetOneCrew({required this.id});
}

class SaveOneLaunches extends HomeEvent {
  final LaunchesModel data;
  const SaveOneLaunches({required this.data});
}

class GetOneLaunchPad extends HomeEvent {
  final String id;
  const GetOneLaunchPad({required this.id});
}

class SortDataLaunches extends HomeEvent {
  final bool? sortByDate;
  final List<LaunchesModel>? data;
  const SortDataLaunches({this.sortByDate, this.data});
}
