import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<EventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
