import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'over_due_invoice_event.dart';
part 'over_due_invoice_state.dart';

class OverDueInvoiceBloc extends Bloc<OverDueInvoiceEvent, OverDueInvoiceState> {
  OverDueInvoiceBloc() : super(OverDueInvoiceInitial()) {
    on<OverDueInvoiceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
