part of 'set_languange_bloc.dart';

sealed class SetLanguangeEvent extends Equatable {
  const SetLanguangeEvent();

  @override
  List<Object> get props => [];
}

class SetLanguage extends SetLanguangeEvent {
  final String language;
  const SetLanguage({required this.language});
}
