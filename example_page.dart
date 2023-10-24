import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/screens/example_cubit.dart';
import 'package:flutter_cubit/screens/example_state.dart';


class ExampleView extends StatelessWidget {
  /// {@macro counter_view}
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ExampleCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ExampleCubit, ExampleState>(
              buildWhen: (previousState, state) {
                return previousState.count != state.count;
              },
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
            const ToggleWidget(),
            textWidget("Cuenta")
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              cubit.add(1);
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              cubit.add(-1);
            },
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            child: const Icon(Icons.tab_sharp),
            onPressed: () {
              cubit.toggle();
            },
          ),
        ],
      ),
    );
  }
}

Widget textWidget(String label) {
  return BlocBuilder<ExampleCubit, ExampleState>(
    buildWhen: (previousState, state) {
      return previousState.count != state.count;
    },
    builder: (context, state) {
      return Text(
        '$label: ${state.count}',
        style: Theme.of(context).textTheme.displayLarge,
      );
    },
  );
}

class ToggleWidget extends StatelessWidget {
  const ToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleCubit, ExampleState>(
      buildWhen: (previousState, state) {
        return previousState.toggle != state.toggle;
      },
      builder: (context, state) {
       return Visibility(child: Text("se veeeee"), visible: state.toggle,);
      },
    );
  }
}
