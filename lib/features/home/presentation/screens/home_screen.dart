import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:slash_task/features/home/presentation/cubit/home_state.dart';
import 'package:slash_task/features/home/presentation/widgets/product_item.dart';

import '../../../../config/routes.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:slash_task/injections.dart' as di;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.homeTitle,
        ),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is SuccessAllDataState|| di.s1<AppCubit>().product.isNotEmpty ) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.57,
                children: List.generate(
                  200,
                  (index) => ProductItem(
                    index: index,
                    product:  di.s1<AppCubit>().product[index],
                    onPressed: () {
                      print(di.s1<AppCubit>().product[index].id);
                      di.s1<AppCubit>().getDetailedProductData(
                        di.s1<AppCubit>().product[index].id,
                          );
                      Navigator.pushNamed(
                        context,
                        Routes.detailsRoute,
                      );
                    },
                  ),
                ),
              ),
            );
          }
          if (state is ErrorAllDataState) {
            return Text(state.error);
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
