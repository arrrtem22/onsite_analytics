import 'package:onsite_analytics/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/non_home_cubit.dart';

class NonHomePage extends StatelessWidget {
  const NonHomePage({super.key, required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NonHomeCubit>(),
      child: const Scaffold(
        body: NonHomeView(),
      ),
    );
  }
}

class NonHomeView extends StatelessWidget {
  const NonHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
