import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/config/routes.dart';
import 'package:slash_task/config/theme.dart';
import 'package:slash_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:slash_task/injections.dart';
import 'package:slash_task/injections.dart' as di;

import 'core/utils/bloc_observer.dart';
void main() {
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(const Slash());
}

class Slash extends StatelessWidget {
  const Slash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.s1<AppCubit>()..getProductsData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        themeMode: ThemeMode.dark,
        theme: appTheme(),
      ),
    );
  }
}
