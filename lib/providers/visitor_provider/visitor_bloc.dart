import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'visitor_event.dart';
part 'visitor_state.dart';

class VisitorBloc extends Bloc<VisitorEvent, VisitorState> {
  VisitorBloc() : super(VisitorInitial()) {
    on<VisitorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
