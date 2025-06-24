part of 'set_languange_bloc.dart';

// sealed class SetLanguangeState extends Equatable {
//   const SetLanguangeState();

//   @override
//   List<Object> get props => [];
// }

// final class SetLanguangeInitial extends SetLanguangeState {}

class SetLanguangeState extends Equatable {
  final LanguageStatus status;

  final String? language;

  const SetLanguangeState({
    this.status = LanguageStatus.initial,

    this.language = "en",
  });
  SetLanguangeState copyWith({
    LanguageStatus? status,
    String? errorMsg,

    String? language,
  }) {
    return SetLanguangeState(
      status: status ?? this.status,

      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [status, language];
}

enum LanguageStatus { initial, loading, loaded, error, success }
