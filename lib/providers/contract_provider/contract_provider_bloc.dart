import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contract_provider_event.dart';
part 'contract_provider_state.dart';

class ContractProviderBloc extends Bloc<ContractProviderEvent, ContractProviderState> {
  ContractProviderBloc() : super(ContractProviderInitial()) {
    on<ContractProviderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
