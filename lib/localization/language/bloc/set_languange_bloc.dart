import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_languange_event.dart';
part 'set_languange_state.dart';

class SetLanguangeBloc extends Bloc<SetLanguangeEvent, SetLanguangeState> {
  SetLanguangeBloc() : super(SetLanguangeState()) {
    on<SetLanguage>(onSetLanguage);
  }
  Future<void> onSetLanguage(
    SetLanguage event,
    Emitter<SetLanguangeState> emit,
  ) async {
    log("sadsd ${event.language}");
    emit(state.copyWith(language: event.language));
  }
}
