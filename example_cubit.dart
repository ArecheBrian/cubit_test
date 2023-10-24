import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/screens/example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleState(count: 0));

  void add(int value) {
    emit(ExampleState(count: state.count + value, toggle: state.toggle));
  }

  void toggle() {
    emit(ExampleState(count: state.count, toggle: !state.toggle));
  }
}