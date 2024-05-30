import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'complaint_provider_event.dart';
part 'complaint_provider_state.dart';

class ComplaintProviderBloc extends Bloc<ComplaintProviderEvent, ComplaintProviderState> {
  ComplaintProviderBloc() : super(ComplaintProviderInitial()) {
    on<ComplaintProviderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
