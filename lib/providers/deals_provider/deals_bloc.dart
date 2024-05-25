import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'deals_event.dart';
part 'deals_state.dart';

class DealsBloc extends Bloc<DealsEvent, DealsState> {
  DealsBloc() : super(DealsInitial()) {
    on<DealsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
