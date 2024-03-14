import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/utils/app_strings.dart';

import 'package:slash_task/features/home/presentation/cubit/home_state.dart';

import '../cubit/home_cubit.dart';

import 'package:slash_task/injections.dart' as di;

import '../widgets/success_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.detailsTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var cubit = di.s1<AppCubit>();
          if (state is SuccessDetailedProductDataState) {
            return SuccessWidget(cubit: cubit);
          } else if (state is ErrorDetailedProductDataState) {
            return Text(
              state.error,
              style: const TextStyle(color: Colors.white, fontSize: 23),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}


