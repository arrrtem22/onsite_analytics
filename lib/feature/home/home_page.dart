import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onsite_analytics/common/common.dart';

import 'cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<HomeCubit>()
        ..init(),
      child: BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          state.whenOrNull(
            navigate: (prompts, pageName) {
              print(pageName);
            }
          );
        },
        child: Scaffold(
          appBar: AppBar(),
          body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: HomeView(),
          ),
        ),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _PromptsWidget(),
        TextField(
          controller: controller,
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text('Go'),
        ),
      ],
    );
  }
}

class _PromptsWidget extends StatelessWidget {
  const _PromptsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return Wrap(
            children: state.prompts
                .map((prompt) =>
                TextButton(
                    onPressed: () => context.read<HomeCubit>().navigate(prompt),
                    child: Text(prompt)))
                .toList(),
          );
        });
  }
}
