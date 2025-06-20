part of 'home_bloc.dart';

class HomeState extends Equatable {
  final HomeStatus status;
  const HomeState({this.status = HomeStatus.initial});
  HomeState copyWith({HomeStatus? status}) {
    return HomeState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}

enum HomeStatus { initial, loading, loaded, error, success }
