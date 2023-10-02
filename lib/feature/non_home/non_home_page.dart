import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onsite_analytics/common/common.dart';

import 'cubit/non_home_cubit.dart';

class NonHomePage extends StatelessWidget {
  const NonHomePage({super.key, required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NonHomeCubit>()..init(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageName),
        ),
        body: const NonHomeView(),
      ),
    );
  }
}

class NonHomeView extends StatelessWidget {
  const NonHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _ImageWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: context.pop,
              child: const Text('Go to previous'),
            ),
            TextButton(
              onPressed: () => context.popUntil(const HomeRoute().location),
              child: const Text('Home'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NonHomeCubit, NonHomeState>(
      builder: (BuildContext context, NonHomeState state) {
        return state.when(
          failure: () => const Text(
            'Error',
            style: TextStyle(color: Colors.red),
          ),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: CircularProgressIndicator(),
            ),
          ),
          general: (imageUrl) {
            return Image.network(imageUrl);
          },
        );
      },
    );
  }
}
